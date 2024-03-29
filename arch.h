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

#define SP R11
#define LR R12
#define XR R13 
#define PC R14
#define FR R15

/* Alternative mode registers */
#define START 0x100

#define ZF (1 << 0) /* Zero flag */
#define IEF (1 << 1) /* Interrupt enable */
#define TF (1 << 2) /* Trap flag */
/* TODO: Call this BF */
#define RF (1 << 3) /* Alternative register bank */
#define IF (1 << 4) /* Interrupt */

typedef uint16_t u16;
typedef uint8_t u8;

#define INST_A   (1 << 0)
#define INST_B   (1 << 1)
#define INST_C   (1 << 2)
#define INST_IMM (1 << 3)
#define INST_ARGLIST  (1 << 4)

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


enum {
  XM_LOAD_WORD,
  XM_STORE_WORD,
  XM_LOAD_BYTE,
  XM_STORE_BYTE,
};

enum {
  INP_INCREMENT,
  INP_DECREMENT,
};

enum {
  B_F_EQUAL = 0x1,
  B_F_LINK  = 0x2,
};



#define INSTRUCTIONS_XMACRO \
  /* 0 */ X( "_halt" , OP_HALT,   0           )\
  /* 1 */ X( "_add",   OP_ADD,    INST_ABC    )\
  /* 2 */ X( "_sub",   OP_SUB,    INST_ABC    )\
  /* 3 */ X( "_ori",   OP_ORI,    INST_A_IMM  )\
  /* 4 */ X( "_xori",  OP_XORI,   INST_A_IMM  )\
  /* 5 */ X( "_sli",   OP_SLI,    INST_AB_IMM  )\
  /* 6 */ X( "_sri",   OP_SRI,    INST_AB_IMM  )\
  /* 7 */ X( "_nand",  OP_NAND,   INST_ABC    )\
  /* 8 */ X( "_beq" ,  OP_BEQ,    INST_ABC    )\
  /* 9 */ X( "_b"   ,  OP_B,      INST_AB     )\
  /* a */ X( "_fmov",  OP_FMOV,   INST_ABC    )\
  /* b */ X( "_stmr",  OP_STMR,   INST_ABC    )\
  /* c */ X( "_ldmr",  OP_LDMR,   INST_ABC    )\
  /* d */ X( "_xm",    OP_XM,     INST_ABC    )\
  /* e */ X( "_inp",   OP_INP,    INST_ABC    )\

#define ALIAS_INSTRUCTIONS_XMACRO\
  X( "fimov",  AOP_FIMOV,  INST_AB     )\
  X( "fomov",  AOP_FOMOV,  INST_AB     )\
  X( "stmr",   AOP_STMR,   INST_ABC    )\
  X( "ldmr",   AOP_LDMR,   INST_ABC    )\
  \
  X( "nop",    AOP_NOP,    INST_NOARG  )\
  X( "lw",     AOP_LW,     INST_AB_IMM )\
  X( "sw",     AOP_SW,     INST_AB_IMM )\
  X( "lb",     AOP_LB,     INST_AB_IMM )\
  X( "sb",     AOP_SB,     INST_AB_IMM )\
  X( "mov",    AOP_MOV,    INST_AB     )\
  \
  X( "nand",   AOP_NAND,  INST_ABC     )\
  X( "and",    AOP_AND,  INST_ABC      )\
  X( "or",     AOP_OR,   INST_ABC      )\
  X( "not",    AOP_NOT,  INST_AB       )\
  X( "xor",    AOP_XOR,  INST_ABC      )\
  \
  X( "push",   AOP_PUSH, INST_A        )\
  X( "pop",    AOP_POP,  INST_A        )\
  \
  X( "b",      AOP_B,    INST_A        )\
  X( "bl",     AOP_BL,   INST_A        )\
  X( "beq" ,   AOP_BEQ,  INST_ABC    )\
  X( "bleq",   AOP_BLEQ, INST_A        )\
  \
  X( "cmp",    AOP_CMP,  INST_AB       )\
  X( "int",    AOP_INT,  INST_A        )\
  \
  X( "ori",    AOP_ORI,    INST_A_IMM  )\
  X( "sli",    AOP_SLI,    INST_AB_IMM )\
  X( "sri",    AOP_SRI,    INST_AB_IMM )\
  X( "halt" ,  AOP_HALT,   0           )\
  X( "sub",    AOP_SUB,  INST_AB       )\
  X( "subi",   AOP_SUBI, INST_A_IMM    )\
  X( "add",    AOP_ADD,    INST_ABC    )\

#define DATA_INSTRUCTIONS_XMACRO\
  X( ".dw",    DOP_DW,     INST_DATA  )\
  X( ".ds",    DOP_DS,     INST_DATA  )\
  X( ".pad",   DOP_PAD,    INST_DATA  )\
  X( ".global",DOP_GLOBAL, INST_DATA  )\

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
    "zr",  "r1",  "r2",  "r3",
    "r4",  "r5",  "r6",  "r7",
    "r8",  "r9",  "r10", "r11",
    "r12", "r13", "r14", "r15",
  };
  switch(r) {
    case ZR: return "zr";
    case SP: return "sp";
    case PC: return "pc";
    case LR: return "lr";
    case XR: return "xr";
    case FR: return "fr";
  }
  return names[r];
}

void inst_print2(FILE *out, struct inst inst)
{
  u16_print(out, htons(*(u16*)&inst));
  
  struct inst_desc *desc = NULL;
  for(int i = 0; i < 16; ++i) {
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
  fprintf(out, "  ");

  if(desc == NULL) {
    fprintf(out,"opcode=%d ???", inst.op);
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




