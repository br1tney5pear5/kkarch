#include "arch.h"
#include <curses.h>

// TODO: REGFILE
// TODO: ALU
// TODO: BUS
// TODO: TIMINGS
// TODO: CLOCKING
// TODO: ONE STEPPING


int em_trace = 1;
void hexdump(char *data, int size, char *caption)
{
	int i; // index in data...
	int j; // index in line...
	char temp[8];
	char buffer[128];
	char *ascii;

	memset(buffer, 0, 128);

	printf("---------> %s <--------- (%d bytes from %p)\n", caption, size, data);

	// Printing the ruler...
	printf("        +0          +4          +8          +c            0   4   8   c   \n");

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
			printf("%s", buffer);
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
		printf("%s", buffer);
}

u16 regfile[NUM_R];
u8 mem[UINT16_MAX];

void print_regfile() {
  int i = 0;
  for(int i = 0;i < 4; ++i) {
    for(int j = 0;j < 4; ++j) {
      int k = i * 4 + j;
      _print_reg(k);
      printf(":%04x %c\t", 
                      regfile[k], 
                      isprint(regfile[k]) ? (char)regfile[k] : '.');
    }
    printf("\n");
  }
  //printf("r1:%04x \t", regfile[R1]);
  //printf("r2:%04x \t", regfile[R2]);
  //printf("r3:%04x \t", regfile[R3]);
  //printf("pc:%04x \t", regfile[PC]);
  //printf("lr:%04x \t", regfile[LR]);
  //printf("sp:%04x \t", regfile[SP]);
  //printf("\n");
}


void store(u16 addr, u16 val) {
  if(addr == 0xffff) {
    FILE *f = fopen("output", "a+");
    fprintf(f, "%c", val & 0xFF);
    fclose(f);
  } 
  if(em_trace)
    printf("store 0x%04x at %04x\n", val, addr);

  *(uint16_t*)&mem[addr] = htons(val);
}

u16 load(u16 addr) 
{
  u16 val = ntohs(*(u16*)&mem[addr]);

  if(addr == 0xffff)
    fail("loading from 0xffff, linker fucked");

  if(em_trace)
    printf("load 0x%04x from %04x\n", val, addr);
  return val;
}

u16 reg_cmp(u8 ra, u8 rb) 
{
  u16 res;
  if(em_trace) {
    _print_reg(ra);
    printf("(0x%04x) == ", regfile[ra]);
    _print_reg(rb);
    printf("(0x%04x)  ", regfile[rb]);
  }
  res = regfile[ra] == regfile[rb];
  if(em_trace) {
    printf(res ? "true" : "false");
    puts("");
  }
  return res;
}

void hard_crash() {
  printf("\n=== HARD CRASH ===\n");
  exit(1);
}

u16 write_reg(u8 reg, u16 val) 
{
  if(em_trace) {
    if(reg == PC) {
      printf("Branch: %04x\n", val);
    }
    _print_reg(reg); printf(" = 0x%04x\n", val);
  }

  //if(reg == ZR) {
  //  hard_crash();
  //}
  regfile[reg] = val;
}

void printio(u8 reg) {
  u16 s = 4;
  printf("   ");
  for(u16 i = regfile[reg] - s; i < regfile[reg] + s + 1; ++i) {
    printf("%02x ", mem[i]);
  }puts("");
  printf("   ");
  _print_reg(reg);
  printf(":%04x  ", regfile[reg]);
  for(u16 i = regfile[reg] - s + 3; i < regfile[reg]; ++i) {
    printf("   ");
  }
  printf("^^^^^\n");
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


//#define EM_CURSES


int main(int argc, char **argv) 
{
#ifdef EM_CURSES
  initscr();
  cbreak();
  noecho();

  int maxlines = LINES - 1;
  int maxcols = COLS - 1;
  for(int i = 0; i < maxlines && i < maxcols; ++i) {
    mvaddch(i, i, '0');
  }

  char strbuf[512] = {};
  sprintf(strbuf, " kkarch em: (%d,%d)", maxlines, maxcols);
  mvaddstr(0,0, strbuf);
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
    printf("%04x: ", i * 2);
    inst_print(inst);
  }
  return 0;
#endif
  puts("\nEmulator");

  hexdump(mem, r, "mem");

  //const char * str;
  //printf("%s:%04x\n", str, crc16(str, strlen(str), 0));
  //printf("%s:%04x\n", str, crc16(str, strlen(str), 0));

  for(int i = 0; i < 2000; ++i) {
    inst.word = ntohs(*(u16*)&mem[regfile[PC]]);

    if(em_trace) {
      printf("%04x > ", regfile[PC]);
      inst_print(inst);
    }

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
      store(regfile[inst.ra], regfile[inst.rb] + inst.rc);
      if(inst.rb == SP && em_trace) printio(inst.rb);
      break;
    case OP_LW:
      write_reg(inst.ra, load(regfile[inst.rb] + inst.rc));
      if(inst.rb == SP && em_trace) printio(inst.rb);
      //printio(inst.rb);
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
      puts("== HALT ==");
      goto exit;
    default:
      hard_crash();
    }
    //sleep(1);
    regfile[R0] = 0;
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
