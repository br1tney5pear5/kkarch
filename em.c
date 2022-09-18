#include "arch.h"
#define OPTS_IMPL
#include "opts.h"
#include <ncurses.h>



// TODO: REGFILE
// TODO: ALU
// TODO: BUS
// TODO: TIMINGS
// TODO: CLOCKING
// TODO: ONE STEPPING

int pse = 0;
int halt = 0;

static struct {
  bool trace;
  bool curses;

} _g = {0};

int writeout_idx = 0;
char writeout_buf[1024] = {0};
const char *status = "";
int intrnum = 0;
u16 last_addr = 0;

FILE *output = NULL;

u16 regfiles[2][NUM_R] = {0};

u16 * rawreg(u8 r, u8 bank)
{
  if(r != FR) {
    return &regfiles[bank][r];
  }
  return &regfiles[0][r];
}

u8 regbank()
{
  /* FR itself shouldn't be banked! */
  return !!(regfiles[0][FR] & RF);
}

void setreg(u8 r, u16 val)
{
  *rawreg(r, regbank()) = val;
}

u16 getreg(u8 r) 
{
  return *rawreg(r, regbank());
}

u8 mem[UINT16_MAX];



void hexdump(char *data, int size, char *caption)
{
	int i; // index in data...
	int j; // index in line...
	char temp[8];
	char buffer[128];
	char *ascii;

	memset(buffer, 0, 128);

	fprintf(output,"---------> %s <--------- (%d bytes from %p)\n", caption, size, data);

	// Printing the ruler...
	fprintf(output,"        +0          +4          +8          +c            0   4   8   c   \n");

	// Hex portion of the line is 8 (the padding) + 3 * 16 = 52 chars long
	// We add another four bytes padding and place the ASCII version...
	ascii = buffer + 58;
	memset(buffer, ' ', 58 + 16);
	buffer[58 + 16] = '\n';
	buffer[58 + 17] = '\0';
	buffer[0] = '+';
	buffer[1] = '0';
	buffer[2] = '0';
	buffer[3] = '0';
	buffer[4] = '0';
	for (i = 0, j = 0; i < size; i++, j++)
	{
		if (j == 16)
		{
			fprintf(output,"%s", buffer);
			memset(buffer, ' ', 58 + 16);

			sprintf(temp, "+%04x", i);
			memcpy(buffer, temp, 5);

			j = 0;
		}

		sprintf(temp, "%02x", 0xff & data[i]);
		memcpy(buffer + 8 + (j * 3), temp, 2);
		if ((data[i] > 31) && (data[i] < 127))
			ascii[j] = data[i];
		else
			ascii[j] = '.';
	}

	if (j != 0)
		fprintf(output,"%s", buffer);
}

u16 prev_regfile[NUM_R];

void print_regfile() {
  int i = 0;
  for(int i = 0;i < 4; ++i) {
    for(int j = 0;j < 4; ++j) {
      int k = i * 4 + j;
      _print_reg(output,k);
      fprintf(output, ":%04x %c\t", 
                      getreg(k), 
                      isprint(getreg(k)) ? (char)getreg(k) : '.');
    }
    fprintf(output, "\n");
  }
  fprintf(output, "r1:%04x \t", getreg(R1));
  fprintf(output, "r2:%04x \t", getreg(R2));
  fprintf(output, "r3:%04x \t", getreg(R3));
  fprintf(output, "pc:%04x \t", getreg(PC));
  fprintf(output, "lr:%04x \t", getreg(LR));
  fprintf(output, "sp:%04x \t", getreg(SP));
  fprintf(output, "\n");
}


void store(u16 addr, u16 val) {
  if(addr == 0xffff) {
    if(!_g.curses) {
      fprintf(stdout, "%c", val & 0xFF);
      fflush(stdout);
    } else {
      char c = val & 0xFF;
      writeout_buf[writeout_idx++] = isprint(c) ? c :'.';
      assert(writeout_idx < 1024);
    }
  } 
  if(_g.trace)
    fprintf(output, "store 0x%04x at %04x\n", val, addr);

  last_addr = addr;
  *(uint16_t*)&mem[addr] = htons(val);
}
u16 _load(u16 addr)  {
  return ntohs(*(u16*)&mem[addr]);
}

u16 load(u16 addr) 
{
  last_addr = addr;
  u16 val = _load(addr);

  if(addr == 0xffff)
    fail("loading from 0xffff, linker fucked");

  if(_g.trace)
    fprintf(output,"load 0x%04x from %04x\n", val, addr);

  return val;
}

u16 reg_cmp(u8 ra, u8 rb) 
{
  u16 res;
  if(_g.trace) {
    _print_reg(output,ra);
    fprintf(output,"(0x%04x) == ", getreg(ra));
    _print_reg(output,rb);
    fprintf(output,"(0x%04x)  ", getreg(rb));
  }
  res = getreg(ra) == getreg(rb);
  if(_g.trace) {
    fprintf(output,res ? "true" : "false");
    fprintf(output, "\n");
  }
  return res;
}

void hard_crash() {
  fprintf(output,"\n=== HARD CRASH ===\n");
  status = "HARD CRASH";
  halt = 0;
  //exit(1);
}

u16 write_reg(u8 r, u16 val) 
{
  if(_g.trace) {
    if(r == PC) {
      fprintf(output,"Branch: %04x\n", val);
    }
    _print_reg(output,r); fprintf(output," = 0x%04x\n", val);
  }

  setreg(r, val);
}

void printio(u8 r) {
  u16 s = 4;
  fprintf(output,"   ");
  for(u16 i = getreg(r) - s; i < getreg(r) + s + 1; ++i) {
    fprintf(output,"%02x ", mem[i]);
  }fprintf(output, "\n");
  fprintf(output,"   ");
  _print_reg(output,r);
  fprintf(output,":%04x  ", getreg(r));
  for(u16 i = getreg(r) - s + 3; i < getreg(r); ++i) {
    fprintf(output,"   ");
  }
  fprintf(output,"^^^^^\n");
}

#define CRC16_POLY 0xEDB8;

u16 crc16(const u8 * data, size_t size, u16 prev)
{
  u16 crc = ~prev;
  while(size--) {
    crc ^= *(data++);
    for(u8 i=0; i < 8; i++)
      crc = (crc >> 1) ^ (crc & 1) * CRC16_POLY;
  }
  return ~crc;
}




#define KBINTR 0xFFF0
#define MULISR 0xFFF2

#define INT_STACK 0x5000

int interrupts_enabled = 1;

int presses = 0;
int check_interrupts()
{
  /* Check if interrupts enabled */
  if(!(getreg(FR) & IEF)) {
    return 0;
  }

  int c = getch();
  intrnum = c; 

  if(c == 32) {
    presses++;
    pse = !pse;
  }

  if(c > 0) {
    *rawreg(FR, 0) |= IF;
  }

  if(*rawreg(FR, 0) & IF) {
    /* Okay, let's see how we can handle interrupts.
     *  - We must be able to execute an interrupt handler and
     *    return to the interrupted code.
     *  - We musn't clobber user's registers (including XR)
     *  - It would be nice if we could support nested interrupts.
     *
     * My initial idea was to have two banks of registers - one for user (A), 
     * one for interrupts (B), and for all registers except flags to be banked. 
     * Then all we would do on an interrupt is to write ISR address to B.PC and 
     * switch banks. Then the interrupt wanting to return would simply switch 
     * banks back, easy and elegant but fails to support nesting.
     *
     * Now maybe we don't care about nesting too much tbh. An alternative is
     * to bank a set of general registers but not PC. Instead, on an interrupt
     * save PC to B.R8 lets say and disable interrupts, then the ISR would
     * have to save B.R8 to its stack and reenable interrupts. This way it
     * could be preempted by another interrupt. 
     *
     * I've done that but returning is a problem - load from stack, write
     * to pc and enabling interrupts all have to happen atomically otherwise 
     * there are problems. Now that I think about actually I would need
     * an iret that is like _freg and _xori at once...
     *
     * Or maybe banking PC is viable but we use the second bank in the beginning
     * only - the interrupt would save user registers and switch to bank A when
     * its ready to do its work - then it could itself be interrupted again. 
     *
     * isr:
     *     DISABLE_INTERRUPTS
     *     B.R1 = A.PC
     *     PUSH B.R1
     *     A.PC = pick_up
     *     SWITCH BANKS B -> A
     *  pick_up:
     *     PUSH <clobbered regs>
     *     ENABLE INTERRUPTS
     *
     *     Do Work... (Here we can be interrupted)
     *
     *     DISABLE INTERRUPTS
     *     POP <clobbered regs>
     *     SWITCH BANKS A -> B
     *     POP B.R1
     *     A.PC = B.R1
     *     ENABLE INTERRUPTS AND SWITCH BANKS AT THE SAME TIME
     *
     *  Thing is - since both enabling interrupts and switching banks
     *  is controlled by the flags registers, doing both wouldn't require
     *  adding somet new esoteric instructions!
     *
     *  This way we get both (probably unnecessary) flexibility, with 
     *  (I think) elegance plus simple 'hardware design' - i.e. all it does on
     *  interrupt is write PC and switch banks and since I'm doing that maybe
     *  I can disable interrupts on an interrupt straight away to avoid the
     *  first instruction.
     *
     *  Now what's cool about this is if you don't want all this mess you can
     *  opt out of nestability and have a simple interrupt like so
     *  simple_isr:
     *      DISABLE_INTERRUPTS
     *      Do work...
     *      ENABLE INTERRUPTS AND SWITCH BANKS AT THE SAME TIME
     *
     *  
     *
     *
     */
    /* Save PC in the second bank */
    //*rawreg(ILR, 1) = getreg(PC);
    *rawreg(R2, 1) = c;
    *rawreg(PC, 1) = load(KBINTR);
    /* TODO: hard crash if already set maybe idk */
    *rawreg(FR, 0) |= RF;
    *rawreg(FR, 0) &= ~IF;


    //getreg(FR) |= RF; /* switch register bank */
    //regfiles[1][LR] = getreg(PC);
    //regfiles[PC] = getreg(PC);

    //getreg(R10) = LR;
    //fprintf(output, "c=%d mem=%04x\n", c, load(KBINTR));
    //getreg(SP) = INT_STACK;
    //getreg(LR) = PC;
    status = "INTERRUPT";
  }
}



void rectangle(int y1, int x1, int y2, int x2)
{
    mvhline(y1, x1, 0, x2-x1);
    mvhline(y2, x1, 0, x2-x1);
    mvvline(y1, x1, 0, y2-y1);
    mvvline(y1, x2, 0, y2-y1);
    mvaddch(y1, x1, ACS_ULCORNER);
    mvaddch(y2, x1, ACS_LLCORNER);
    mvaddch(y1, x2, ACS_URCORNER);
    mvaddch(y2, x2, ACS_LRCORNER);
}

#define RING_SIZE 64
int inst_ring_cnt = 0;
int inst_ring_idx = 0;

struct {
  struct inst inst;
  uint16_t pc;
} inst_ring[RING_SIZE];

void hexdumpw() 
{
}

void regdumpw(int bank, int y, int x)
{
  int i = 0;

  char strbuf[512];

  for(int i = 0; i < 4; ++i) {
    for(int j = 0; j < 4; ++j) {
      int k = i * 4 + j;

      //FILE *fbuf = fmemopen(strbuf, sizeof(strbuf), "w");
      //_print_reg(fbuf, k);
      //fprintf(fbuf, ":%04x\t", getreg(k));

//      if(getreg(k) != prev_getreg(k))
//	attron(COLOR_PAIR(1));

      mvprintw(y + i, x + j * 12, "%3s: %04x", 
          regname_cstr(k), *rawreg(k, bank));
      //fclose(fbuf);

//      if(getreg(k) != prev_getreg(k))
//	attroff(COLOR_PAIR(1));
    }
  }
  move(y + 5, x);
  printw("ZF=%d ", !!(getreg(FR) & ZF));
  printw("IEF=%d ", !!(getreg(FR) & IEF));
  printw("TF=%d ", !!(getreg(FR) & TF));
  printw("RF=%d ", !!(getreg(FR) & RF));
  printw("IF=%d ", !!(getreg(FR) & IF));
}


void memdumpw(int y, int x) 
{
  move(y,x);
  for(int i = -7; i < 8; ++i) {
    move(y + i + 4,x);
    u16 addr = last_addr + 8*i;
    printw("%04x:  ", addr);
    for(int j = 0; j < 8; ++j) {
      if(i == 0 && j < 2) {
        attron(COLOR_PAIR(1));
      }
      printw("%02x ", mem[addr + j]);
      if(i == 0 && j < 2) {
        attroff(COLOR_PAIR(1));
      }
    }
  }
}



void refresh_curses(struct inst inst)
{
  clear();
  int maxlines = LINES - 1;
  int maxcols = COLS - 1;
  //for(int i = 0; i < maxlines && i < maxcols; ++i) {
  //  mvaddch(i, i, '0');
  //}
  
  mvprintw(0,2, "intr %s %d %04x", status, intrnum, _load(KBINTR));

  do {
    int x = 2, y = 2;
    int h = 25, w = 80;

    rectangle(y, x, y + h, x + w);
    mvprintw(y + 4, x + 4, writeout_buf);
    char strbuf[512];


#if 1
    inst_ring[inst_ring_idx].inst = inst;
    inst_ring[inst_ring_idx].pc = getreg(PC);
    inst_ring_cnt++;

    int n = 30;

    mvprintw(y + h + 1 + n, x + 0, ">");
    for(int off = 0; off < n && off < inst_ring_cnt; ++off) {
      memset(strbuf, 0 , 512);
      struct inst inst = inst_ring[(inst_ring_idx + off) & (RING_SIZE - 1)].inst;
      uint16_t pc = inst_ring[(inst_ring_idx + off) & (RING_SIZE - 1)].pc;

      move(y + h + 1 + n - off, x + 2);
      struct inst_desc *desc = &opcode_map[inst.op];

      printw("%04x: ", pc);

      for(int i = 15; i >= 0; --i)
        printw("%d", 1 & (inst.word >> i));

      printw("  %-5s", desc->opcode);


      if(desc->type & INST_A) {
        printw("   %-3s", regname_cstr(inst.ra));
        if(desc->type & INST_B) {
          printw("  %-3s", regname_cstr(inst.rb));
          if(desc->type & INST_C) {
            printw("  %-3s", regname_cstr(inst.rc));
          } else if (desc->type & INST_IMM) {
            printw("  %d", inst.rc);
          }
        } else if (desc->type & INST_IMM) {
          attron(COLOR_PAIR(2));
          printw("  %02x", inst.imm);
          attroff(COLOR_PAIR(2));
        }
      }
      printw("      ");
      switch(inst.op){
        //case OP_SW:
        //  printw("store %04x at %04x", 
        //      getreg(inst.ra), getreg(inst.rb));
        //  break;
        //case OP_LW:
        //  printw("load %04x from %04x", 
        //      getreg(inst.ra), getreg(inst.rb));
        //  break;
        //case OP_BEQ:
        //  if(reg_cmp(inst.rb, inst.rc))
        //    printw("branch to %04x", getreg(inst.ra));
      }
    }
    if(--inst_ring_idx < 0) inst_ring_idx = RING_SIZE - 1;

#endif
    regdumpw(0, y + h + 2, x + w + 2);
    for(int i = 0; i < NUM_R; ++i) {
      prev_regfile[i] = getreg(i);
    }
    regdumpw(1, y + h + 7, x + w + 2);
    //memcpy(prev_regfile, regfile, NUM_R * sizeof(u16));
    memdumpw(y + h + 16, x + w + 2);
  } while(0);
  refresh();
}

int main(int argc, char **argv) 
{
  int clock = 100;
  const char *image_filename = NULL;
  {
    struct option opts[] = {
      { "image", 'i',
        .desc = "Troll image to run."
      },
      { "clock", 'c',
        .desc = "Clockspeed in hertz."
      },
      { "curses", 'u', OPT_F_BOOLEAN,
        .desc = "Curses user interface."
      },
      { "trace", 't', OPT_F_BOOLEAN,
        .desc = "Trace the execution.",
      },
      { "help", '?', OPT_F_BOOLEAN,
        .desc = "Print this help."
      },
      { NULL },
    };
    struct option_parser parser = {};
    int rc;
    while(!(rc = parse_options_incrementally(&parser, opts, argc - 1, argv + 1))) 
    {
      switch(parser.current->short_name) {
        case 'i':
          image_filename = parser.current->string_params[0];
          break;
        case 'c':
          clock = atoi(parser.current->string_params[0]);
          break;
        case 'u':
          _g.curses = true;
          break;
        case 't':
          _g.trace = true;
          break;
        case '?':
          print_options_help(stdout, opts);
          exit(EXIT_SUCCESS);
          assert(0);
      }
    }
    if(rc != OPT_E_DONE)
      exit(EXIT_FAILURE);
  }

  if(_g.curses) {
    initscr();
    cbreak();
    nodelay(stdscr, true);
    noecho();
    //noraw();
    start_color();
    init_pair(1, COLOR_YELLOW, COLOR_BLACK);
    init_pair(2, COLOR_MAGENTA, COLOR_BLACK);
    //int maxlines = LINES - 1;
    //int maxcols = COLS - 1;
    //for(int i = 0; i < maxlines && i < maxcols; ++i) {
    //  mvaddch(i, i, '0');
    //}

    //char strbuf[512] = {};
    //sprintf(strbuf, " kkarch em: (%d,%d)", maxlines, maxcols);
    //mvaddstr(0,0, strbuf);
  }

  if(_g.curses) {
    output = fopen("em.out", "w");
  } else {
    output = stdout;
  }
  last_addr = START;

  assert(argc > 1);
  int fd = open(image_filename, O_RDONLY);
  if(fd < 0) fail("Fail");
  int r = read(fd, mem + START, UINT16_MAX);

  if(!_g.curses) {
    for(int i = 0; i < r/2; ++i) {
      struct inst inst = {
        .word = ntohs(*(u16*)&mem[START + i])
      };
      inst_print2(stdout, inst);
      printf("\n");
    }
  }

  setreg(PC, START);
  struct inst inst;

#if 0
  puts("\nPRogram");
  for(int i = 0; i < r/2; ++i) {
    inst.word = ntohs(img[i]);
    fprintf(output,"%04x: ", i * 2);
    inst_print(output,inst);
  }
  return 0;
#endif

  fprintf(output, "Emulator\n");
  //hexdump(mem, r, "mem");

  //for(int i = 0; i < 2000; ++i) {
  while(true) {
    inst.word = ntohs(*(u16*)&mem[getreg(PC)]);

    if(_g.trace) {
      fprintf(output, "%04x > ", getreg(PC));
      inst_print2(output,inst); fprintf(output, "\n");
    }

    if(!pse) {
      setreg(PC, getreg(PC) + 2);

      switch(inst.op) {
      case OP_ADD:
        write_reg(inst.ra, getreg(inst.rb) + getreg(inst.rc));
        break;
      case OP_SUB:
        write_reg(inst.ra, getreg(inst.rb) - getreg(inst.rc));
        if(getreg(inst.ra))
          setreg(FR, getreg(FR) & ~ZF);
          //getreg(FR) &= ~ZF;
        else 
          setreg(FR, getreg(FR) | ZF);
          //getreg(FR) |= ZF;
        break;
      case OP_NAND:
        write_reg(inst.ra, ~(getreg(inst.rb) & getreg(inst.rc)));
        break;
      //case OP_SW:
      //  /* FIXME: rc ignored */
      //  store(getreg(inst.rb), getreg(inst.ra));
      //  setreg(inst.rb, getreg(inst.rb) + (int16_t)getreg(inst.rc));
      //  if(inst.rb == SP && _g.trace) printio(inst.rb);
      //  break;
      //case OP_LW:
      //  /* FIXME: rc ignored */
      //  write_reg(inst.ra, load(getreg(inst.rb)));
      //  setreg(inst.rb, getreg(inst.rb) + (int16_t)getreg(inst.rc));
      //  if(inst.rb == SP && _g.trace) printio(inst.rb);
      //  break;
      case OP_ORI:
        write_reg(inst.ra, getreg(inst.ra) | inst.imm);
        break;
      case OP_XORI:
        write_reg(inst.ra, getreg(inst.ra) ^ inst.imm);
        break;
      case OP_SLI: 
        write_reg(inst.ra, getreg(inst.rb) << inst.rc);
        break;
      case OP_SRI: 
        write_reg(inst.ra, getreg(inst.rb) >> inst.rc);
        break;
      case OP_BEQ:
        if(reg_cmp(inst.rb, inst.rc))
          write_reg(PC, getreg(inst.ra));
        break;

      case OP_B:
        if((inst.ra & B_F_EQUAL) && !(getreg(FR) & ZF))
          break;
        if(inst.ra & B_F_LINK)
          write_reg(LR, getreg(PC));
        write_reg(PC, getreg(inst.rb));
        break;

      case OP_FMOV:
        /* TODO: Trace won't work here */
        if(inst.rc) {
          *rawreg(inst.ra, !regbank()) = *rawreg(inst.rb, regbank());
        } else {
          *rawreg(inst.ra, regbank()) = *rawreg(inst.rb, !regbank());
        }
        break;

      case OP_XM:
        switch(inst.rc) {
          case XM_LOAD_WORD:
            write_reg(inst.ra, load(getreg(inst.rb)));
            break;
          case XM_STORE_WORD:
            store(getreg(inst.rb), getreg(inst.ra));
            break;
          case XM_LOAD_BYTE:
            break;
          case XM_STORE_BYTE:
            break;
          default:
            hard_crash();
        }
        break;
      case OP_STMR:
        if(inst.ra <= inst.rb) {
          for(int i = inst.ra; i <= inst.rb; ++i) {
            store(getreg(inst.rc), getreg(i));
            write_reg(inst.rc, getreg(inst.rc) + 2);
          }
        } else {
          for(int i = inst.ra; i >= inst.rb; --i) {
            store(getreg(inst.rc), getreg(i));
            write_reg(inst.rc, getreg(inst.rc) + 2);
          }
        }
        break;
      case OP_LDMR:
        if(inst.ra <= inst.rb) {
          for(int i = inst.ra; i <= inst.rb; ++i) {
            write_reg(inst.rc, getreg(inst.rc) - 2);
            write_reg(i, load(getreg(inst.rc)));
          }
        } else {
          for(int i = inst.ra; i >= inst.rb; --i) {
            write_reg(inst.rc, getreg(inst.rc) - 2);
            write_reg(i, load(getreg(inst.rc)));
          }
        }
        break;
      case OP_HALT:
        fprintf(output, "== HALT ==\n");
        halt = true;
        goto nointr;
        break;

      default:
        hard_crash();
      }
    }

    check_interrupts();

    setreg(R0, 0);

nointr:
    if(!pse) 
      refresh_curses(inst);

    if(halt) {
      pause();
      goto exit;
    }

    usleep(1000 * 1000/clock);
  }

exit:
  if(_g.curses) {
    getch();
    refresh();
    endwin();
  }
  print_regfile();
  close(fd);
}


