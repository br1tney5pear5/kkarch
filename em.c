#include "arch.h"
#include <ncurses.h>

// TODO: REGFILE
// TODO: ALU
// TODO: BUS
// TODO: TIMINGS
// TODO: CLOCKING
// TODO: ONE STEPPING

#define HZ 3

#define EM_CURSES
int pse = 0;

int writeout_idx = 0;
char writeout_buf[1024] = {0};
const char *status = "";
int intrnum = 0;

FILE *output = NULL;

int em_trace = 1;
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
u16 regfile[NUM_R];

u8 mem[UINT16_MAX];

void print_regfile() {
  int i = 0;
  for(int i = 0;i < 4; ++i) {
    for(int j = 0;j < 4; ++j) {
      int k = i * 4 + j;
      _print_reg(output,k);
      fprintf(output, ":%04x %c\t", 
                      regfile[k], 
                      isprint(regfile[k]) ? (char)regfile[k] : '.');
    }
    fprintf(output, "\n");
  }
  fprintf(output, "r1:%04x \t", regfile[R1]);
  fprintf(output, "r2:%04x \t", regfile[R2]);
  fprintf(output, "r3:%04x \t", regfile[R3]);
  fprintf(output, "pc:%04x \t", regfile[PC]);
  fprintf(output, "lr:%04x \t", regfile[LR]);
  fprintf(output, "sp:%04x \t", regfile[SP]);
  fprintf(output, "\n");
}


void store(u16 addr, u16 val) {
  if(addr == 0xffff) {
    FILE *f = fopen("output", "a+");
    fprintf(f, "%c", val & 0xFF);
    fclose(f);
    char c = val & 0xFF;
    writeout_buf[writeout_idx++] = isprint(c) ? c :'.';
    assert(writeout_idx < 1024);
  } 
  if(em_trace)
    fprintf(output,"store 0x%04x at %04x\n", val, addr);

  *(uint16_t*)&mem[addr] = htons(val);
}

u16 load(u16 addr) 
{
  u16 val = ntohs(*(u16*)&mem[addr]);

  if(addr == 0xffff)
    fail("loading from 0xffff, linker fucked");

  if(em_trace)
    fprintf(output,"load 0x%04x from %04x\n", val, addr);

  return val;
}

u16 reg_cmp(u8 ra, u8 rb) 
{
  u16 res;
  if(em_trace) {
    _print_reg(output,ra);
    fprintf(output,"(0x%04x) == ", regfile[ra]);
    _print_reg(output,rb);
    fprintf(output,"(0x%04x)  ", regfile[rb]);
  }
  res = regfile[ra] == regfile[rb];
  if(em_trace) {
    fprintf(output,res ? "true" : "false");
    fprintf(output, "\n");
  }
  return res;
}

void hard_crash() {
  fprintf(output,"\n=== HARD CRASH ===\n");
  exit(1);
}

u16 write_reg(u8 reg, u16 val) 
{
  if(em_trace) {
    if(reg == PC) {
      fprintf(output,"Branch: %04x\n", val);
    }
    _print_reg(output,reg); fprintf(output," = 0x%04x\n", val);
  }

  //if(reg == ZR) {
  //  hard_crash();
  //}
  regfile[reg] = val;
}

void printio(u8 reg) {
  u16 s = 4;
  fprintf(output,"   ");
  for(u16 i = regfile[reg] - s; i < regfile[reg] + s + 1; ++i) {
    fprintf(output,"%02x ", mem[i]);
  }fprintf(output, "\n");
  fprintf(output,"   ");
  _print_reg(output,reg);
  fprintf(output,":%04x  ", regfile[reg]);
  for(u16 i = regfile[reg] - s + 3; i < regfile[reg]; ++i) {
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

#define INT_STACK 0x5000

int interrupts_enabled = 1;

int presses = 0;
int check_interrupts()
{
//  if(!interrupts_enabled)
//    return 0;

  int c = getch();
  intrnum = c; 

  if(c == 32) {
    presses++;
    pse = !pse;
  }

  if(c > 0 && load(KBINTR)) {
    fprintf(output, "c=%d mem=%04x\n", c, load(KBINTR));
    regfile[SP] = INT_STACK;
    regfile[LR] = PC;
    regfile[PC] = load(KBINTR);
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
int inst_ring_idx = 0;

struct {
  struct inst inst;
  uint16_t pc;
} inst_ring[RING_SIZE];

void hexdumpw() 
{
}

void regdumpw(int y, int x)
{
  int i = 0;

  char strbuf[512];

  for(int i = 0; i < 4; ++i) {
    for(int j = 0; j < 4; ++j) {
      int k = i * 4 + j;

      //FILE *fbuf = fmemopen(strbuf, sizeof(strbuf), "w");
      //_print_reg(fbuf, k);
      //fprintf(fbuf, ":%04x\t", regfile[k]);

      if(regfile[k] != prev_regfile[k])
	attron(COLOR_PAIR(1));

      mvprintw(y + i, x + j * 12, "%3s:%05x", 
          regname_cstr(k), regfile[k]);
      //fclose(fbuf);

      if(regfile[k] != prev_regfile[k])
	attroff(COLOR_PAIR(1));
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
  
  mvprintw(0,2, "intr %s %d %04x", status, intrnum, load(KBINTR));

  do {
    int x = 2, y = 2;
    int h = 25, w = 80;

    rectangle(y, x, y + h, x + w);
    mvprintw(y + 4, x + 4, writeout_buf);
    char strbuf[512];


#if 1
    inst_ring[inst_ring_idx].inst = inst;
    inst_ring[inst_ring_idx].pc = regfile[PC];

    int n = 30;

    mvprintw(y + h + 1 + n, x + 0, ">");
    for(int off = 0; off < n; ++off) {
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
        case OP_SW:
          printw("store %04x at %04x", 
              regfile[inst.ra], regfile[inst.rb]);
          break;
        case OP_LW:
          printw("load %04x from %04x", 
              regfile[inst.ra], regfile[inst.rb]);
          break;
        case OP_BEQ:
          if(reg_cmp(inst.rb, inst.rc))
            printw("branch to %04x", regfile[inst.ra]);
      }
    }
    if(--inst_ring_idx < 0) inst_ring_idx = RING_SIZE - 1;

#endif
    regdumpw(y + h + 2, x + w + 2);

  } while(0);
  refresh();
}

int main(int argc, char **argv) 
{
#ifdef EM_CURSES
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
#endif

#ifdef EM_CURSES
  output = fopen("em.out", "w");
#else
  output = stdout;
#endif

  assert(argc > 1);
  int fd = open(argv[1], O_RDONLY);
  if(fd < 0) fail("Fail");
  int r = read(fd, mem, UINT16_MAX);

  regfile[PC] = 0;
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

  for(int i = 0; i < 2000; ++i) {
    inst.word = ntohs(*(u16*)&mem[regfile[PC]]);

    if(em_trace) {
      fprintf(output, "%04x > ", regfile[PC]);
      inst_print(output,inst);
    }

    if(!pse) {
      regfile[PC] += 2;

      switch(inst.op) {
      case OP_ADD:
        write_reg(inst.ra, regfile[inst.rb] + regfile[inst.rc]);
        break;
      //case OP_ADDI:
      //  write_reg(inst.ra, regfile[inst.ra] + inst.imm);
      //  break;
      case OP_NAND:
        write_reg(inst.ra, ~(regfile[inst.rb] & regfile[inst.rc]));
        break;
      case OP_SW:
        /* FIXME: rc ignored */
        store(regfile[inst.rb], regfile[inst.ra]);
        if(inst.rb == SP && em_trace) printio(inst.rb);
        break;
      case OP_LW:
        /* FIXME: rc ignored */
        write_reg(inst.ra, load(regfile[inst.rb]));
        if(inst.rb == SP && em_trace) printio(inst.rb);
        break;
      case OP_ORI:
        write_reg(inst.ra, regfile[inst.ra] | inst.imm);
        break;
      case OP_SLI: 
        write_reg(inst.ra, regfile[inst.rb] << inst.rc);
        break;
      case OP_SRI: 
        write_reg(inst.ra, regfile[inst.rb] >> inst.rc);
        break;
      case OP_BEQ:
        if(reg_cmp(inst.rb, inst.rc))
          write_reg(PC, regfile[inst.ra]);
        break;
      case OP_HALT:
        fprintf(output, "== HALT ==\n");
        pause();
        goto exit;
      default:
        hard_crash();
      }

      regfile[R0] = 0;
    }

    check_interrupts();
    if(!pse) 
      refresh_curses(inst);

    memcpy(prev_regfile, regfile, sizeof(regfile));
    usleep(1000 * 1000/HZ);
  }

exit:
#ifdef EM_CURSES
  getch();
  refresh();
  endwin();
#endif
  print_regfile();
  close(fd);
}


