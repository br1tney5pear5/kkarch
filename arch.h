#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>
#include <unistd.h>
#include <fcntl.h>
#include <ctype.h>
#include <errno.h>
#include <arpa/inet.h>

//Regular text
#define BLK "\e[0;30m"
#define RED "\e[0;31m"
#define GREEN "\e[0;32m"
#define YELLOW "\e[0;33m"
#define BLU "\e[0;34m"
#define MAG "\e[0;35m"
#define CYN "\e[0;36m"
#define WHT "\e[0;37m"
#define RESET "\e[0;0m"

enum {
  R0,  R1,  R2,  R3,
  R4,  R5,  R6,  R7,
  R8,  R9,  R10, R11,
  R12, R13, R14, R15,
  NUM_R,
};

#define ZR R0
#define ILR R7

#define FR R11
#define SP R12
#define LR R13
#define PC R14
#define XR R15 

/* Alternative mode registers */
#define START 0x100

#define ZF (1 << 0) /* Zero flag */
#define IF (1 << 1) /* Interrupt enable */
#define TF (1 << 2) /* Trap flag */
#define RF (1 << 3) /* Alternative register bank */

typedef uint16_t u16;
typedef uint8_t u8;

#define INST_A   (1 << 0)
#define INST_B   (1 << 1)
#define INST_C   (1 << 2)
#define INST_IMM (1 << 3)

#define INST_AB INST_A | INST_B
#define INST_ABC INST_A | INST_B | INST_C
#define INST_A_IMM INST_A | INST_IMM
#define INST_AB_IMM INST_A | INST_B | INST_IMM

#define INST_DATA (1 << 4)
#define INST_NOARG 0

// Register Register Register
// Register Immediate or Label
// Register Register Immediate
// RRR
// RI
// RRI

#define INSTRUCTIONS_XMACRO \
  X( "_halt" , OP_HALT,   0           )\
  X( "_lw",    OP_LW,     INST_ABC    )\
  X( "_sw",    OP_SW,     INST_ABC    )\
  X( "_add",   OP_ADD,    INST_ABC    )\
  X( "_sub",   OP_SUB,    INST_ABC    )\
  X( "_ori",   OP_ORI,    INST_A_IMM  )\
  X( "_xori",  OP_XORI,   INST_A_IMM  )\
  X( "_sli",   OP_SLI,    INST_AB_IMM  )\
  X( "_sri",   OP_SRI,    INST_AB_IMM  )\
  X( "_xor" ,  OP_NAND,   INST_ABC    )\
  X( "_beq" ,  OP_BEQ,    INST_ABC    )\
  X( "_b"   ,  OP_B,      INST_A_IMM  )\
  X( "_freg",  OP_FREG,   INST_AB  )\

#define ALIAS_INSTRUCTIONS_XMACRO\
  X( "add",    AOP_ADD,    INST_ABC    )\
  X( "lw",     AOP_LW,     INST_AB_IMM )\
  X( "sw",     AOP_SW,     INST_AB_IMM )\
  X( "ori",    AOP_ORI,    INST_A_IMM  )\
  X( "sli",    AOP_SLI,    INST_AB_IMM )\
  X( "sri",    AOP_SRI,    INST_AB_IMM )\
  X( "nand" ,  AOP_NAND,   INST_ABC    )\
  X( "beq" ,   AOP_BEQ,    INST_ABC    )\
  X( "halt" ,  AOP_HALT,   0           )\
  X( "sub",    AOP_SUB,  INST_AB       )\
  X( "subi",   AOP_SUBI, INST_A_IMM    )\
  X( "mov",    AOP_MOV,  INST_AB       )\
  X( "nop",    AOP_NOP,  INST_NOARG    )\
  X( "push",   AOP_PUSH, INST_A        )\
  X( "pop",    AOP_POP,  INST_A        )\
  X( "and",    AOP_AND,  INST_ABC      )\
  X( "bl",     AOP_BL,   INST_A        )\
  X( "b",      AOP_B,    INST_A        )\
  X( "sb",     AOP_SB,   INST_AB_IMM   )\
  X( "lb",     AOP_LB,   INST_AB_IMM   )\
  X( "cmp",    AOP_CMP,  INST_AB       )\

#define DATA_INSTRUCTIONS_XMACRO\
  X( ".dw",   DOP_DW,   INST_DATA  )\
  X( ".ds",   DOP_DS,   INST_DATA  )\
  X( ".pad",  DOP_PAD,   INST_DATA  )\

#define X(OPCODE, OP, TYPE) OP,
enum {
  INSTRUCTIONS_XMACRO
  NUM_OP,
  ALIAS_INSTRUCTIONS_XMACRO
  DATA_INSTRUCTIONS_XMACRO
};
#undef X

struct inst_desc {
  const char *opcode;
  u8 opcode_len;
  u8 type;
  u8 op;
};

#define X(OPCODE, OP, TYPE)\
  { .opcode = OPCODE,\
    .opcode_len = (sizeof(OPCODE) - 1),\
    .op = OP,\
    .type = TYPE,\
  },
struct inst_desc opcode_map[] = {
  INSTRUCTIONS_XMACRO
  ALIAS_INSTRUCTIONS_XMACRO
  DATA_INSTRUCTIONS_XMACRO
  { .opcode = NULL }
};
#undef X

struct inst {
  union {
    u16 op:4;
    struct {
      u16 _op1:4, ra:4, rb:4, rc:4;
    };
    struct {
      u16 _op2:4, _ra:4, imm:8;
    };
    u16 word;
  };
};

void u16_print(FILE *out, u16 inst) 
{
  fprintf(out, "%04x  ", inst);

  for(int i = 15; i >= 0; --i)
    fprintf(out, "%d", 1 & (inst >> i));
}

void _print_reg(FILE *out, u8 r) {
  switch(r) {
    case ZR: fprintf(out, "zr"); break;
    case SP: fprintf(out, "sp"); break;
    case PC: fprintf(out, "pc"); break;
    case LR: fprintf(out, "lr"); break;
    case XR: fprintf(out, "xr"); break;
    case FR: fprintf(out, "fr"); break;
    default: fprintf(out, "r%u", r); break;
  }
}


const char *regname_cstr(u8 r) 
{
  static const char *names[] = {
    "zr", "r1", "r2", "r3",
    "r4", "r5", "r6", "r7",
    "r8", "r9", "r10", "fr",
    "sp", "lr", "pc", "xr",
  };
  return names[r];
}

void inst_print2(FILE *out, struct inst inst)
{
  u16_print(out, htons(*(u16*)&inst));
  
  struct inst_desc *desc = NULL;
  for(int i = 0; i < 8; ++i) {
    if(inst.op == opcode_map[i].op) {
      desc = &opcode_map[i];
      break;
    }
  }
  fprintf(out,"  ");

  if(desc == NULL) {
    fprintf(out,"???");
    goto exit;
  }

  fprintf(out,"%-5s", desc->opcode);

  if(desc->type & INST_A) {
    fprintf(out,"  "); _print_reg(out,inst.ra);
    if(desc->type & INST_B) {
      fprintf(out,"  "); _print_reg(out,inst.rb);
      if(desc->type & INST_C) {
        fprintf(out,"  "); _print_reg(out,inst.rc);
      } else if (desc->type & INST_IMM) {
        fprintf(out,", %d", inst.rc);
      }
    } else if (desc->type & INST_IMM) {
      fprintf(out,", %d", inst.imm);
    }
  }
exit:
  return;
}

void inst_print(FILE *out, struct inst inst)
{
  //u16_print(out, htons(*(u16*)&inst));
  
  struct inst_desc *desc = NULL;
  for(int i = 0; i < 8; ++i) {
    if(inst.op == opcode_map[i].op) {
      desc = &opcode_map[i];
      break;
    }
  }
  fprintf(out,"  ");

  if(desc == NULL) {
    fprintf(out,"???");
    goto exit;
  }

  fprintf(out,"%-5s", desc->opcode);

  if(desc->type & INST_A) {
    fprintf(out,"  "); _print_reg(out,inst.ra);
    if(desc->type & INST_B) {
      fprintf(out,"  "); _print_reg(out,inst.rb);
      if(desc->type & INST_C) {
        fprintf(out,"  "); _print_reg(out,inst.rc);
      } else if (desc->type & INST_IMM) {
        fprintf(out,", %d", inst.rc);
      }
    } else if (desc->type & INST_IMM) {
      fprintf(out,", %d", inst.imm);
    }
  }
exit:
  fprintf(out,"\n");
}

#define fail(...) \
  do {\
    fflush(stdout);\
    fprintf(stderr, "%s:%d: ", __func__, __LINE__);\
    fprintf(stderr, __VA_ARGS__);\
    fprintf(stderr, "\n");\
    exit(-1);\
  } while(0)


struct sym {
  struct sym *next;
  u16 hash;
  int len;
  char str[];
};




