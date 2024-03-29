/*
 *
 * Custom 16-bit assembler
 *
 */
#include "arch.h"
#include "troll.h"
#include "arena.h"
#define DEBUG


// TODO: // ABOLISH PARSE ABC JUST PARSE  ARGS
int output_fd = -1;

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

int inst_count[16] = {0};

struct arena *strtab_arena = NULL;
struct arena *symtab_arena = NULL;

#if 0 
struct htab {
  u16 hash;
  u16 off;
  void *data;
};
#endif

struct arena *reloca_arena = NULL;

struct arena *inst_arena = NULL;

// struct htab sym_htab[1000];

char *strtab_find(const char *str, troll16_size_t len)
{
  size_t lkp_len = 0;
  struct arena *arena = strtab_arena;
  while(arena) {
    char *lkp = arena->data;
    char *end = arena->data + arena->off;

    while(lkp < end) {
      lkp_len = strlen(lkp);

    //  printf("%s cmp %s %s\n", __func__, lkp, str);
      if(lkp_len == len && !memcmp(lkp, str, len))
        return lkp;

      lkp += lkp_len + 1;
    }
    arena = arena->next;
  }
  return NULL;
}

char *strtab_alloc(const char *str, troll16_size_t len)
{
  if(!strtab_arena) {
    strtab_arena = new_arena(ARENA_SIZE);
    assert(strtab_arena);
  }

  char *buf = arena_alloc(strtab_arena, len + 1);
  assert(buf);
  memcpy(buf, str, len);
  buf[len] = '\0';
  printf("%s %s\n",__func__, buf);

  return buf;
}

struct troll16_sym *sym_find(char *str, troll16_size_t len)
{
  struct troll16_sym *lkp, *end;
  struct arena *arena = symtab_arena;
  while(arena) {
    lkp = (void*)(arena->data);
    end = (void*)(arena->data + arena->off);

    while(lkp < end) {
      char *name = arena_at(strtab_arena, lkp->name);
      printf("name %s\n", name);
      if(name) {
        int lkp_len = strlen(name);
        // printf("CMP %d '%.*s' '%s' %d\n", len, len, str, name, lkp_len);

        if(lkp_len == len && !memcmp(str, name, len))
          return lkp;
      }

      lkp++;
    }
    arena = arena->next;
  }
  return NULL;
}


struct troll16_sym *sym_alloc(
    char *str, troll16_size_t len, troll16_addr_t value)
{
  if(!symtab_arena)
    symtab_arena = new_arena(ARENA_SIZE);
  /* This lazy evaluates in strtab_alloc */
  if(!strtab_arena)
    strtab_arena = new_arena(ARENA_SIZE);

  struct troll16_sym *sym = 
    arena_alloc(symtab_arena, sizeof(struct troll16_sym));

  int ret = arena_offsetof(strtab_arena, strtab_alloc(str, len));
  if(ret < 0)
    fail("WTF");

  sym->name = ret; 
  sym->value = value;

  printf("sym_alloc str='%.*s' name=%d value=%d\n", 
      len, str, sym->name, sym->value);


  return sym;
}


struct troll16_sym *sym_get(char *str, troll16_size_t len)
{
  struct troll16_sym *ret = sym_find(str, len);
  if(!ret)
    ret = sym_alloc(str, len, 0);

  printf("%s %.*s %s %p\n", __func__, len, str, ret);
  return ret;
}

#if 0 

struct troll_sym *label(char *label, size_t len) 
{
  struct sym *sym = arena_alloc(symtab_arena, sz);
  memset(sym, 0, sizeof(*sym));
  memcpy(sym->str, label, len);
  sym->str[len] = '\0';
  sym->hash = crc16(sym->str, len, 0);
  sym->len = len;
#if 0 
  struct htab *ent = sym_htab;
  for(; ent->data; ++ent) {
    if(hash == ent->hash && !strncmp(label, ent->data, len))
      break;
  }

  if(!ent->data) {
    ent->hash = hash;
    ent->data = sym_alloc(label, len);
  }

#endif
  return ent;
}
#endif

#if 0 
struct reloc {
  struct reloc *next;
  struct htab *sym;
  int offset;
  int reftype;
};
#endif

#if 0 
#define LABEL_MAX 15
struct label {
  char name[LABEL_MAX + 1];
  u16 addr;
  u16 value;
};

#define LBUF_SZ 100

u16 labelidx = 0;
struct label labels[LBUF_SZ];
#endif

#define IMM_MAX 128
#define IMM_MASK 127

#define FBUF_SZ 256
char filebuf[FBUF_SZ];

u16 reg(char *reg) {
  printf("REGISTER %c%c\n", reg[0], reg[1]);
  if(reg[0] == 'r' && '0' < reg[1] && reg[1] < '9') {
    return reg[1];
  }
  fail("Invalid register");
}


#define LEN(X) sizeof(X)/sizeof(X[0])



#if 0
  case '':
    if(len < 2)
      goto err;

    (*buf)++; (*len)--;
    flags |= 0x1;
    goto label;
  }

  if() {
label:
    if(isdigit(**buf))
      goto err;

    tok = *buf;
    while( len && (isalnum(**buf) || **buf == '_')) {
      (*buf)++; (*len)--;
    }

    toklen = *buf - tok;

    for(int i = 0; i < labelidx; ++i) {
      if(strlen(labels[i].name) == toklen && !memcmp(labels[i].name, tok, toklen)) {
        arg.type = ARG_IMM;
        arg.value = flags & 0x1 ? labels[i].value : labels[i].addr;
        flags |= 0x2;
        break;
      }
    }
    if(!(flags & 0x2))
      fail("Unknown label");
  }
#endif


char *gettok(char **buf, int *len, char d)
{
  char *tok = NULL;
  while(*len > 0 && isspace(**buf)) {
    (*buf)++; (*len)--;
  }
  tok = *buf;
  //if(len > 0 && tok[0] == '"') { /* string literal */
  //  while(*len > 0 && !isspace(**buf) && **buf != d) { 
  //    (*buf)++; (*len)--;
  //  }
  //  fail("Unterminated string literal");

  //} else {
    while(*len > 0 && !isspace(**buf) && **buf != d) {
      (*buf)++; (*len)--;
    }
  //}
  //printf("%s '%.*s'\n", __func__, *buf - tok, tok);
  return tok;
}

u8 parse_reg(char *buf, int len) 
{
  if(len == 2) {
    if(buf[0] == 'r' && '0' <= buf[1] && buf[1] < '9') {
      return buf[1] - '0';
    }
    if(buf[0] == 'p' && buf[1] == 'c')
      return PC;

    if(buf[0] == 's' && buf[1] == 'p')
      return SP;

    if(buf[0] == 'l' && buf[1] == 'r')
      return LR;
  }
  fail("Invalid register");
}

int parse_imm(char *buf, int len) 
{
  int ret;
  char *npos; // TODO: init

  if(len > 2 && buf[0] == '0') {
    switch(buf[1]) {
      case 'x': ret = strtol(buf, &npos, 16); break;
      case 'o': ret = strtol(buf, &npos, 8); break;
      case 'b': ret = strtol(buf, &npos, 2); break;
      default:  ret = strtol(buf, &npos, 2); break;
    }
    // TODO: check for error
  } else if(isalpha(buf[0]) || buf[0] == '@') {
#if 0  
    int found  = 0;
    int atsign = 0;
    for(int i = 0; i < labelidx; ++i) {
      //printf("%s %d, %.*s %d \n", labels[i].name, strlen(labels[i].name), len, buf, len);
      if(len > 1 && buf[0] == '@')  {
        atsign = 1;
        buf++; len--;
      }

      if(strlen(labels[i].name) == len && !memcmp(labels[i].name, buf, len)) {
        if(atsign) {
          ret = labels[i].value;
        } else {
          ret = labels[i].addr;
        }
        found = 1;
        break;
      }
    }
    if(!found)
      fail("Invalid label");
#endif
  } else if(len == 3 && buf[0] == '\'' && buf[2] == '\''){

    ret = buf[1];
  } else {
    ret = strtol(buf, &npos, 10);

    if(errno != 0 || npos != (buf + len))
      fail("Invalid immediate value");
  }

  //if(max && ret > max) 
  //  fail("Immediate value out of range");

  return ret;
}

//char *gettok(char **buf, int *len, char d)
//{
//}

u16 offset = 0;

//struct label *current_label = NULL;

void emit_word(u16 word)
{
  u16 *i = arena_alloc(inst_arena, sizeof(u16));
  *i = htons(word);
  offset += 2;

  //if(current_label) {
  //  current_label->value = word;
  //  current_label = NULL;
  //}
}
void emit_data2(struct inst inst, size_t n) 
{
  printf("emit: %04x: ", offset);
  u16_print(stdout, inst.word);
  printf("\n");
  printf(" *** %zu\n", n);
  for(int i = 0; i < n; ++i)
    emit_word(inst.word);
}

void emit_data(struct inst inst) 
{
  printf("emit: %04x: ", offset);
  u16_print(stdout, inst.word);
  printf("\n");
  emit_word(inst.word);
}

void emit(struct inst inst) 
{
  //if(instidx > LEN(instbuf))
  //  fail("TOo many instructions");

  printf("emit: %04x: ", offset);
  inst_print(stdout,inst);
  emit_word(inst.word);
}

#define EMIT_ADD(A, B, C)\
  emit((struct inst)\
      { .op = OP, .ra = A, .rb = B, .rc = C })

#define EMIT_ADDI(A, IMM)\
  emit((struct inst)\
      { .op = OP, .ra = A, .imm = B })

enum {
  ARG_INVALID,
  ARG_REG,
  ARG_IMM,
  ARG_STR,
  ARG_LABEL,
  ARG_AT_LABEL,
  ARG_DATA,
  ARG_REGLIST,
};


struct arg {
  u8 type; 
  u16 value; 

  struct troll16_sym *sym;
  u8 reftype;

  u8 reglist_len;
  u8 reglist[15];
};

struct arg rarg[NUM_R];

u16 stridx = 0;
char strs[100][100];

void print_arg(struct arg *arg) 
{
  switch(arg->type) {
  case ARG_REG: printf("register: "); _print_reg(stdout,arg->value); printf("\n"); break;
  case ARG_STR: printf("string: %s\n", strs[arg->value]); break;
  case ARG_IMM: printf("immediate: %d\n", arg->value); break;
  default: printf("???\n"); break;
  }
}



#if 1 

size_t reloca_arena_cnt = 0;

void reloc(struct troll16_sym *sym, troll16_addr_t offset, troll_u8_t type) 
{
  ///static struct reloc *prev_reloc;
  if(!reloca_arena)
    reloca_arena = new_arena(ARENA_SIZE);

  struct troll16_reloca *
    reloca = arena_alloc(reloca_arena, sizeof(struct troll16_reloca));

  reloca->offset = offset;
  reloca->addend = 0;
  reloca->type = type;
  assert(sym);
  reloca->sym = sym->name;
  
  printf(YELLOW "reloc %04x %s\n" RESET, 
      reloca->offset, troll_reloca_type_cstr(type));
  reloca_arena_cnt++;
#if 0  
  reloc->sym = sym;
  reloc->offset = offset;
  reloc->reftype = reftype;
  if(prev_reloc)
    prev_reloc->next = reloc;
  prev_reloc = reloc;

#endif

#if 0
  printf("pending reloc: %04x %s for %s\n", 
      offset, 
      reftype == REF_FULL ? "full" : (reftype == REF_LOWER ? "lower" : (reftype == REF_UPPER ? "upper" : "???")),
      sym->data);
#endif
}
#endif

#if 0 
int reloc_size() 
{
  int cnt = 0;

  struct reloc *reloc = NULL;
  if(reloca_arena)
    reloc = (struct reloc*)reloca_arena->data;

  for(; reloc; reloc = reloc->next) 
    cnt++;

  return cnt * sizeof(struct troll_reloc);
}
#endif
#if 0
void write_reloc(int fd)
{
  struct reloc *reloc = NULL;
  if(reloca_arena)
    reloc = (struct reloc*)reloca_arena->data;

  struct troll_reloc troll_reloc = {};

  for(; reloc; reloc = reloc->next) {
    printf("WRITE RELOC %04x %s\n", reloc->offset, reloc->sym->data);
    troll_reloc.offset = reloc->offset;
    troll_reloc.reftype = reloc->reftype;
    troll_reloc.symoff = reloc->sym->off;
    write(fd, &troll_reloc, sizeof(struct troll_reloc));
  }
}
#endif

//void ref(struct arg *arg, )
//{
//
//}

u16 deref(struct arg *arg, u16 offset)
{
  if(arg->type == ARG_LABEL || arg->type == ARG_AT_LABEL) {
    const char *symname = strtab_arena->data + arg->sym->name;
    printf(YELLOW "=== DEREF %s\n" RESET, symname);
    
    //assert(arg->sym);
    reloc(arg->sym, offset, arg->reftype);
  }

  switch(arg->reftype) {
    case REF_FULL:
      printf(YELLOW "  REF_FULL %04x\n" RESET, arg->value);
      return arg->value;
    case REF_LOWER:
      printf(YELLOW "  REF_LOWER %04x\n" RESET, arg->value & 0xFF);
      return arg->value & 0xFF;
    case REF_UPPER:
      printf(YELLOW "  REF_UPPER %04x\n" RESET, (arg->value >> 8) & 0xFF);
      return (arg->value >> 8) & 0xFF;
    default:
      fail("Busted");
  }
  return 0;
}



#define MAX_ARG 4

struct as {
  struct inst_desc *desc;
  union {
    struct arg a[MAX_ARG];
    struct arg args[MAX_ARG];
  };
};

void as_print(struct as *as) 
{
  //printf("%s", as->desc->opcode)

}

int advance(char **buf, int *len, int inc) 
{
  assert(inc <= *len);
  (*buf) += inc;
  (*len) -= inc;
  return inc;
}

/* space must be skipped beforehand */
int getreg(struct arg *arg, char *buf, int len) 
{ 
  //printf("%.*s\n", len, buf);
  int toklen = 0;
  while(len && isalnum(buf[toklen])) {
    toklen++; len--;
  }

  if(2 <= toklen && toklen <= 3) {
    /*  */ if(buf[0] == 's' && buf[1] == 'p') {
      arg->value = SP; goto out;
    } else if(buf[0] == 'l' && buf[1] == 'r') {
      arg->value = LR; goto out;
    } else if(buf[0] == 'p' && buf[1] == 'c') {
      arg->value = PC; goto out;
    } else if(buf[0] == 'z' && buf[1] == 'r') {
      arg->value = ZR; goto out;
    } else if(buf[0] == 'f' && buf[1] == 'r') {
      arg->value = FR; goto out;
    } else if(buf[0] == 'x' && buf[1] == 'r') {
      arg->value = XR; goto out;
    } else if(buf[0] == 'r') {
      if(!isdigit(buf[1]))
        goto fail;

      if(toklen == 3) {
        if(!isdigit(buf[2]))
          goto fail;

        arg->value = 10 * (buf[1] - '0') + (buf[2] - '0');
      } else {
        arg->value = (buf[1] - '0');
      }

      if(arg->value >= NUM_R) 
        fail("Invalid register number");

      goto out;
    }
  }

fail:
  return -1;
out:
  arg->type = ARG_REG;
  return toklen;
}


int skip_next_comma(char *buf, int len) 
{
  int orig_len = len;
  /* skip potential comma */
  while(len > 0 && isspace(*buf)) {
    buf++; len--;
  }
  /* ...but only one comma */
  if(len && *buf == ',') {    
    buf++; len--;
    return orig_len - len;
  }
  return 0;
}

int skip_space(char *buf, int len) 
{
  int orig_len = len;
  while(len > 0 && isspace(*buf)) {
    buf++; len--;
  }
  return orig_len - len;
}

int skip_blank(char *buf, int len) 
{
  int orig_len = len;
  while(len > 0 && isblank(*buf)) {
    buf++; len--;
  }
  return orig_len - len;
}

//int skip_char(char *buf) {
//}

/* space must be skipped beforehand */
int get_reglist(struct arg *arg, char *buf, int len) 
{
  int toklen = 1;
  int orig_len = len;

  printf("%s:%d %s\n", __func__, __LINE__, buf);
  if(len < 2 || *buf != '{')
    return -1;

  buf++; len--;

  arg->reglist_len = 0;

  struct arg reg, altreg;

  while(1) {
    memset(&reg, 0, sizeof(reg));
    advance(&buf, &len, skip_space(buf, len));
    toklen = getreg(&reg, buf, len);
    if(toklen > 0) {
      assert(reg.type == ARG_REG);
      advance(&buf, &len, toklen);
      if(len && *buf == '-') {
        advance(&buf, &len, 1);
        toklen = getreg(&altreg, buf, len);
        if(toklen < 0) return -1;
        advance(&buf, &len, toklen);

        int lo = reg.value, hi = altreg.value;
        if(lo <= hi){
          for(int i = lo; i <= hi; ++i)
            arg->reglist[arg->reglist_len++] = i;
        } else {
          for(int i = lo; i >= hi; --i)
            arg->reglist[arg->reglist_len++] = i;
        }
      } else {
        arg->reglist[arg->reglist_len++] = reg.value;
      }
      advance(&buf, &len, skip_next_comma(buf, len));
    } else 
      break;
  }

  if(len == 0 || *buf != '}')
    fail("Unterminated register list");

  buf++; len--;

  arg->type = ARG_REGLIST;
  return orig_len - len;
}

int get_string(struct arg *arg, char *buf, int len) 
{
  enum {
    ESCAPE        = 0x1,
    START_QUOTE   = 0x2,
    END_QUOTE     = 0x4,
  };
  int orig_len = len;
  u8 flags = 0;
  char *s = NULL;

  if((len >= 2) && *buf == '"') { /* string */
    flags |= START_QUOTE;
    s = strs[stridx++];

    buf++; len--;

    while(len) {
      if(flags & ESCAPE) {
        switch(*buf) {
        case 'a': *(s++) = 7;  break;
        case 'b': *(s++) = 8;  break;
        case 't': *(s++) = 9;  break;
        case 'n': *(s++) = 10; break;
        case 'v': *(s++) = 11; break;
        case 'f': *(s++) = 12; break;
        case 'r': *(s++) = 13; break;
        // TODO: \0 as well
        case '0': *(s++) = 0; break;
        case '"': *(s++) = '"'; break;
        case '\\': *(s++) = '\\'; break;
        default: 
          fail("Invalid escape character '\\%c'", *buf);
        }
        flags &= ~ESCAPE;
      } else {
        if(*buf == '"') {
          flags |= END_QUOTE;
          buf++; len--;
          break;
        } else if(*buf == '\\') {
          flags |= ESCAPE;
        } else {
          *(s++) = *buf;
        }
      }
      buf++; len--;
    }

    if(flags & START_QUOTE) {
      if(!(flags & END_QUOTE))
        fail("Unterminated string");
    } else 
      return 0;

    arg->type = ARG_STR;
    arg->value = stridx - 1;
    *(s++) = '\0';
  }
  return orig_len - len;
}
#if 0
int get_reg() {
do { /* register */
    tok = *buf;
    toklen = *len;
    while(toklen && isalnum(*tok)) {
      tok++; toklen--;
    }
    tok = *buf;
    toklen = *len - toklen;
    if(2 <= toklen && toklen <= 3) {
      /*  */ if(tok[0] == 's' && tok[1] == 'p' && (flags |= 0x2)) {
        arg->value = SP;
      } else if(tok[0] == 'l' && tok[1] == 'r' && (flags |= 0x2)) {
        arg->value = LR;
      } else if(tok[0] == 'p' && tok[1] == 'c' && (flags |= 0x2)) {
        arg->value = PC;
      } else if(tok[0] == 'r') {
        if(!isdigit(tok[1]))
          break;

        if(toklen == 3) {
          if(!isdigit(tok[2]))
            break;

          arg->value = 10 * (tok[1] - '0') + (tok[2] - '0');
        } else {
          arg->value = (tok[1] - '0');
        }

        if(arg->value >= NUM_R) 
          fail("Invalid register number");

        flags |= 0x2;
      }
    }

    if(flags & 0x2) {
      *len -= toklen;
      *buf += toklen;
      arg->type = ARG_REG;
      goto out;
    }
  } while(0);
}
#endif


int get_id(char *buf, int len) 
{
  int orig_len = len;

  if(!len || isdigit(*buf))
    return 0;

  while(len && (
        isalnum(*buf) || isdigit(*buf) || 
        *buf == '_' || *buf == '.')) 
  {
    buf++; len--;
  }
  return orig_len - len;
}

char *get_id2(char *s)
{
  if(isdigit(*s))
    return s;
  while(*s != '\0' && 
        (isalnum(*s) || isdigit(*s) || *s == '_' || *s == '.'))
    s++;
  return s;
}


int get_label(struct arg *arg, char *buf, int len) 
{
  enum {
    AT_LABEL  = 0x1,
    FOUND     = 0x2,
  };
  int orig_len = len;
#if 1
  int flags = 0;
  char * tok;
  int toklen;

  if(!len) 
    return 0;

  if(*buf == '@') {
    buf++; len--;
    if(!len)
      fail("@ without label");
    flags |= AT_LABEL;
  }

  if(isdigit(*buf))
    return 0;

  tok = buf;
  while(len && (isalnum(*buf) || *buf == '_')) {
    buf++; len--;
  }
  toklen = buf - tok;

  arg->sym = sym_get(tok, toklen);

  //arg->sym->flags = 0;

  //arg->sym = sym_alloc(tok, toklen, offset);
  //arg->value = flags & AT_LABEL ? labels[i].value : labels[i].addr;

  //if(!(flags & FOUND))
  //  return 0;

#if 0
  for(int i = 0; i < labelidx; ++i) {
    //printf("LABEL %s %d %.*s %d\n", labels[i].name, strlen(labels[i].name), toklen, tok, toklen);
    if(strlen(labels[i].name) == toklen && !memcmp(labels[i].name, tok, toklen)) {
      // TODO add to reloc symbols
      arg->value = flags & AT_LABEL ? labels[i].value : labels[i].addr;
      arg->sym = sym_alloc(tok, toklen, offset);
      flags |= FOUND;
      break;
    }
  }
#endif

  arg->type = ARG_IMM;
  arg->type = flags & AT_LABEL ? ARG_AT_LABEL : ARG_LABEL;
out:
  return orig_len - len;
#endif
}

int getarg(struct arg *arg, char **buf, int *len) 
{
  int flags = 0;
  char *tok = NULL;
  char *s = NULL; /* for strtol */
  int toklen;

  advance(buf, len, skip_space(*buf, *len));

  if(*len == 0 || **buf == '\n' || **buf == '#')
    return -1;

  //printf("%s %.*s\n", __func__, *len -1, *buf);

  toklen = get_string(arg, *buf, *len);
  if(toklen) {
    advance(buf, len, toklen);
    goto out;
  }

#if 1
  /* escape */
  if( *len >= 3 && 
      (*buf)[0] == '\'' && (*buf)[2] == '\'') {
    arg->type = ARG_IMM;
    arg->value = (*buf)[1];
    *buf += 3; *len -= 3;
    goto out;
  }
#endif

#if 1
  /* TODO: merge with getreg */
  do { /* register */
    tok = *buf;
    toklen = *len;
    while(toklen && isalnum(*tok)) {
      tok++; toklen--;
    }
    tok = *buf;
    toklen = *len - toklen;
    if(2 <= toklen && toklen <= 3) {
      /*  */ if(tok[0] == 's' && tok[1] == 'p' && (flags |= 0x2)) {
        arg->value = SP;
      } else if(tok[0] == 'l' && tok[1] == 'r' && (flags |= 0x2)) {
        arg->value = LR;
      } else if(tok[0] == 'p' && tok[1] == 'c' && (flags |= 0x2)) {
        arg->value = PC;
      } else if(tok[0] == 'z' && tok[1] == 'r' && (flags |= 0x2)) {
        arg->value = ZR;
      } else if(tok[0] == 'f' && tok[1] == 'r' && (flags |= 0x2)) {
        arg->value = FR;
      } else if(tok[0] == 'x' && tok[1] == 'r' && (flags |= 0x2)) {
        arg->value = XR;
      } else if(tok[0] == 'r') {
        if(!isdigit(tok[1]))
          break;

        if(toklen == 3) {
          if(!isdigit(tok[2]))
            break;

          arg->value = 10 * (tok[1] - '0') + (tok[2] - '0');
        } else {
          arg->value = (tok[1] - '0');
        }

        if(arg->value >= NUM_R) 
          fail("Invalid register number");

        flags |= 0x2;
      }
    }

    if(flags & 0x2) {
      *len -= toklen;
      *buf += toklen;
      arg->type = ARG_REG;
      goto out;
    }
  } while(0);
#else
  toklen = getreg(arg, *buf, *len);
  if(toklen > 0) {
    advance(buf, len, toklen);
    //*len -= toklen;
    //*buf += toklen;
    goto out;
  }
#endif

#if 1
  toklen = get_reglist(arg, *buf, *len);
  if(toklen > 0) {
    advance(buf, len, toklen);
    goto out;
  }
#endif

#if 1
  if(**buf == '-' || isdigit(**buf)) { /* number */
#if 1
    s = *buf + *len;
    long value = strtol(*buf, &s , 0);
    if(errno != 0 || s == NULL)
      fail("Invalid immediate value");

    if(value > 0) {
      assert(value >= INT16_MIN);
      //int16_t v16 = value;
      arg->value = (uint16_t)(int16_t)value;
      printf("ARG %04x\n", arg->value);
    } else {
      assert(value <= UINT16_MAX);
      arg->value = (uint16_t)value;
    }

    *len -= s - *buf;
    *buf = s;
    arg->type = ARG_IMM;
    goto out;


#else
    s = *buf + *len;
    if(*len > 2 && **buf == '0') {
      switch((*buf)[1]) {
        case 'x': arg->value = strtol(*buf, &s, 16); break;
        case 'o': arg->value = strtol(*buf, &s, 8);  break;
        case 'b': arg->value = strtol(*buf, &s, 2);  break;
        default: fail("Invalid numeral");
      }
    } else {
      arg->value = strtol(*buf, &s, 10); 
    }
    if(errno != 0 || s == NULL)
      fail("Invalid immediate value");

    *len -= s - *buf;
    *buf = s;
    arg->type = ARG_IMM;
    goto out;
#endif
  }
#endif

  toklen = get_label(arg, *buf, *len);
  if(toklen) {
    advance(buf, len, toklen);
    goto out;
  }

err:
  fflush(stdout);
  return -1;
out:
#if 0  
  /* skip potential comma */
  while(*len > 0 && isspace(**buf)) {
    (*buf)++; (*len)--;
  }
  if(*len && **buf == ',') {
    (*buf)++; (*len)--;
  }
#else
//  advance(buf, len, skip_next_comma(*buf, *len));
#endif
  //print_arg(arg);
  return 0;
}

char* getnum2(char *s, struct arg *arg)
{
  char *e = s;
  char *ne;
  if(!(*e == '-' || isdigit(*e)))
    return s;

  /* TODO: need my own function for this */
  errno = 0;
  long value = strtol(s, &ne , 0);
  if(errno != 0 || ne == NULL)
    fail("Invalid immediate value");

  if(value > 0) {
    assert(value >= INT16_MIN);
    arg->value = (uint16_t)(int16_t)value;
    //printf("ARG %04x\n", arg->value);
  } else {
    assert(value <= UINT16_MAX);
    arg->value = (uint16_t)value;
  }
  arg->type = ARG_IMM;
  return ne;
}


char* getreg2(char *s, struct arg *arg)
{
  int len;
  char *e = s;

  while(isalnum(*e)) {
    e++;
    if(e-s > 3)
      return s;
  }
  len = e-s;
  if(len < 2)
    return s;

  /*  */ if(len == 2 && s[0] == 's' && s[1] == 'p') {
    arg->value = SP;
  } else if(len == 2 && s[0] == 'l' && s[1] == 'r') {
    arg->value = LR;
  } else if(len == 2 && s[0] == 'p' && s[1] == 'c') {
    arg->value = PC;
  } else if(len == 2 && s[0] == 'z' && s[1] == 'r') {
    arg->value = ZR;
  } else if(len == 2 && s[0] == 'f' && s[1] == 'r') {
    arg->value = FR;
  } else if(len == 2 && s[0] == 'x' && s[1] == 'r') {
    arg->value = XR;
  } else if(s[0] == 'r') {
    if(!isdigit(s[1]))
      return s;
    if(e-s == 2) {
      arg->value = (s[1] - '0');
    } else {
      if(!isdigit(s[2]))
        return s;
      arg->value = 10 * (s[1] - '0') + (s[2] - '0');
    }
    if(arg->value >= NUM_R) 
      fail("Invalid register number");
  } else {
    return s;
  }
  printf("VALID REGISTER %.*s\n", e-s,s);
  arg->type = ARG_REG;
  return e;
}

char* getreglist2(char *s, struct arg *arg) 
{
  printf("%s:%d %s\n", __func__, __LINE__, s);

  int comma;
  char *e, *r;

  e = s;
  if(*e != '{')
    return e;
  e++;
  arg->reglist_len = 0;
  struct arg reg, altreg;
  comma = 1;
  while(1) {
    memset(&reg, 0, sizeof(reg));
    while(isspace(*e))
      e++;
    r = getreg2(e, &reg);
    if(r == e)
      break;
    if(!comma)
      fail("NO comma between args");
    comma = 0;
    e = r;
    if(*e == '-') {
      e++;
      r = getreg2(e, &altreg);
      if(r == e)
        fail("Invalid reglist");
      e = r;
      int lo = reg.value, hi = altreg.value;
      if(lo <= hi){
        for(int i = lo; i <= hi; ++i)
          arg->reglist[arg->reglist_len++] = i;
      } else {
        for(int i = lo; i >= hi; --i)
          arg->reglist[arg->reglist_len++] = i;
      }
    } else {
      arg->reglist[arg->reglist_len++] = reg.value;
    }
    while(isspace(*e))
      e++;
    if(*e == ',') {
      comma = 1;
      e++;
    }
  }
  arg->type = ARG_REGLIST;
  return e;
}


char* do_get_label(char *s)
{
  if(isdigit(*s))
    return s;
  while(*s != '\0' && (isalnum(*s) || *s == '_'))
    s++;
  return s;
}

char* getlab2(char *s, struct arg *arg) 
{
  int type = ARG_LABEL;
  char *e;

  if(*s == '@') {
    s++;
    type = ARG_AT_LABEL;
  }
  e = do_get_label(s);
  if(e==s)
    return s;
  arg->sym = sym_get(s, e-s);
  arg->type = type;
  return e;
}

char* getstr2(char *s, struct arg *arg) 
{
  char *str;
  char *e;
  e = s;
  if(*e != '"')
    return s;
  e++;
  str = strs[stridx];
  /* FIXME! */
  while(*e != '\0' && *e != '"')
    e++;
  if(*e != '"')
    fail("Invalid string");
  s++;
  str = strs[stridx++];
  arg->type = ARG_STR;
  arg->value = stridx;
  memcpy(&strs[stridx], s, e-s);
  strs[stridx][e-s] = '\0';
  printf("%s\n", strs[stridx]);
  e++;
  stridx++;
  return e;
}


char *getarg2(char *s, struct arg *arg)
{
  char *e;
  e = getstr2(s, arg);
  if(e != s)
    return e;
  e = getreg2(s, arg);
  if(e != s)
    return e;
  e = getreglist2(s, arg);
  if(e != s)
    return e;
  e = getnum2(s, arg);
  if(e != s)
    return e;
  e = getlab2(s, arg);
  if(e != s)
    return e;
  return s;
}


#define EMIT_INST_VMACRO(_1, _2, _3, _4, OVERLOAD, ...) OVERLOAD
#define EMIT_INST(...) \
  EMIT_INST_VMACRO(__VA_ARGS__, EMIT_INST_4, EMIT_INST_3, EMIT_INST_2, EMIT_INST_1)(__VA_ARGS__)

#define EMIT_INST_1(OP)             emit_inst(OP, NULL, NULL, NULL, emit_cb)
#define EMIT_INST_2(OP, A)          emit_inst(OP, A, NULL, NULL, emit_cb)
#define EMIT_INST_3(OP, A, B)       emit_inst(OP, A, B, NULL, emit_cb)
#define EMIT_INST_4(OP, A, B, C)    emit_inst(OP, A, B, C, emit_cb)

//#define EMIT_INST_5(OP, A, B, C, D) emit_inst(OP, A, B, C, D)


#define DO_EMIT_COUNT(OP, A, B, C)\
  ({\
      if(emit_cb != count_emit) {\
        counter = 0;\
        do_emit_inst(desc, A, B, C, count_emit);\
      }\
      counter;\
   })


struct inst_desc *opcode(char *buf, int len) 
{
  struct inst_desc *desc = opcode_map;
  for(; desc->opcode; ++desc) {
    if(len != desc->opcode_len)
      continue;

    if(memcmp(buf, desc->opcode, len))
      continue;
    
    return desc;
  }
  return NULL;
}

void do_emit_inst(
    struct inst_desc *desc, struct arg *a, struct arg *b, struct arg *c, 
    void emit_cb(struct inst_desc *, struct arg *, struct arg *, struct arg *));

void emit_inst(
    u8 op, struct arg *a, struct arg *b, struct arg *c, 
    void emit_cb(struct inst_desc *, struct arg *, struct arg *, struct arg *)
    ) 
{
  struct inst_desc *desc = opcode_map;
  for(;desc->opcode; ++desc) {
    if(desc->op == op) {
      do_emit_inst(desc, a, b, c, emit_cb);
      return;
    }
  }
  assert(0);
}



void actually_emit(
    struct inst_desc *desc, struct arg *a, struct arg *b, struct arg *c)
{
  struct inst inst = {};
  //printf("actually emit %s\n", desc->opcode);
  inst.op = desc->op;
  inst_count[inst.op]++;


  if(a && desc->type & INST_A) {
    inst.ra = a->value;
    if(b) {
      if(desc->type & INST_B) {
        inst.rb = b->value;
        if(c && (desc->type & INST_C || desc->type & INST_IMM)) {
          inst.rc = c->value;
        }
      } else if (desc->type & INST_IMM) {
        inst.imm = deref(b, offset);
      }
    }
  }
  FILE * f = fopen("code.dump", "a+");
  inst_print2(f, inst);
  fprintf(f, "\n");
  fclose(f);

  emit(inst);
}

int counter = 0;

void count_emit(
    struct inst_desc *desc, struct arg *a, struct arg *b, struct arg *c)
{
   counter++;
}


void do_emit_inst(
    struct inst_desc *desc, struct arg *a, struct arg *b, struct arg *c, 
    void emit_cb(struct inst_desc *, struct arg *, struct arg *, struct arg *)
    )
{
  struct arg arg = {};
  struct inst inst = {};

  if(!emit_cb)
    emit_cb = actually_emit;
  
  if(desc->op < NUM_OP) {
    /* normal opcode */
    emit_cb(desc, a, b, c);
  } else {
    switch(desc->op) {
    case AOP_FIMOV:
      arg.type = ARG_IMM; arg.value = 0;
      EMIT_INST(OP_FMOV, a, b, &arg);
      break;
    case AOP_FOMOV:
      arg.type = ARG_IMM; arg.value = 1;
      EMIT_INST(OP_FMOV, a, b, &arg);
      break;
    case AOP_STMR:
      EMIT_INST(OP_STMR, a, b, c);
      break;
    case AOP_LDMR:
      EMIT_INST(OP_LDMR, a, b, c);
      break;
//    case AOP_SW:
//      assert(a && a->type == ARG_REG && b);
//      //if(c) {
//      //  printf("%p %d %d\n", c, c->type, c->value);
//      //  assert(c->type == ARG_IMM || c->type == ARG_INVALID);
//      //  assert((c->value & 0xF) == c->value);
//      //}
//      if(b->type == ARG_REG) {
//        struct arg *addend = NULL;
//        if(c) {
//          switch(c->type) {
//            case ARG_REG: 
//              addend = c; 
//              break;
//            case ARG_IMM: 
//              EMIT_INST(AOP_MOV, &rarg[XR], c);
//              addend = &rarg[XR]; 
//              break;
//            case ARG_INVALID:
//              break;
//            default:
//              assert(0);
//          }
//        }
//        EMIT_INST(OP_SW, a, b, addend);
//      } else if(b->type == ARG_IMM) {
//        EMIT_INST(AOP_MOV, &rarg[XR], b);
//        EMIT_INST(OP_SW, a, &rarg[XR], c);
//      } else {
//        assert(0);
//      }
//      break;
    case AOP_SW:
    case AOP_LW:
      if(a->type != ARG_REG && b->type != ARG_REG) {
        fail("At least one operand must be a register");
      } else {
        if(a->type != ARG_REG) {
          EMIT_INST(AOP_MOV, &rarg[XR], a);
          a = &rarg[XR];
        }
        if(b->type != ARG_REG) {
          EMIT_INST(AOP_MOV, &rarg[XR], b);
          b = &rarg[XR];
        }
      }
      arg.type = ARG_IMM;
      if(desc->op == AOP_SW) {
        arg.value = XM_STORE_WORD;
      } else {
        assert(desc->op == AOP_LW);
        arg.value = XM_LOAD_WORD;
      }
      EMIT_INST(OP_XM, a, b, &arg);
      break;

    case AOP_SB:
      arg.type = ARG_IMM;
      arg.value = XM_STORE_BYTE;
      EMIT_INST(OP_XM, a, b, &arg);
      break;

    case AOP_LB:
      arg.type = ARG_IMM;
      arg.value = XM_LOAD_BYTE;
      EMIT_INST(OP_XM, a, b, &arg);
      break;



    //case AOP_SB:
    //  assert(a && a->type == ARG_REG && b);
    //  EMIT_INST(OP_LW, &rarg[XR], a);
    //  arg.type = ARG_IMM;
    //  arg.value = 8;
    //  EMIT_INST(OP_SRI, &rarg[XR], &rarg[XR], &arg);
    //  EMIT_INST(OP_SLI, &rarg[XR], &rarg[XR], &arg);
    //  if(b->type == ARG_REG) {

    //  } else if(b->type == ARG_IMM) {
    //    assert(b->value <= 0xFF);
    //  } else {
    //    assert(0);
    //  }
    //  EMIT_INST(OP_SW, a, &rarg[XR]);
    //  break;

    //case AOP_LB:
    //  EMIT_INST(AOP_LW, a, b);
    //  arg.type = ARG_IMM;
    //  arg.value = 8;
    //  EMIT_INST(OP_SRI, a, a, &arg);
    //  EMIT_INST(OP_SLI, a, a, &arg);
    //  break;

    case AOP_SUB:
      if(c->type != ARG_REG) {
        EMIT_INST(AOP_MOV, &rarg[XR], c);
        c = &rarg[XR];
      }
      EMIT_INST(OP_SUB, a, b, c);
      break;
    case AOP_ADD:
      assert(a && a->type == ARG_REG && b && b->type == ARG_REG && c);
      if(c->type == ARG_REG) {
        EMIT_INST(OP_ADD, a, b, c);
      } else if(c->type == ARG_IMM) {
        EMIT_INST(AOP_MOV, &rarg[XR], c);
        EMIT_INST(OP_ADD, a, b, &rarg[XR]);
      } else {
        assert(0);
      }
      break;
    case AOP_ORI:
      //assert(a && a->type == ARG_REG && b && b->type == ARG_IMM && !c);
      printf("%p %p %p", a, b, c);
      EMIT_INST(OP_ORI, a, b);
      break;
    case AOP_MOV:
      assert(a && a->type == ARG_REG && b);
      if(b->type == ARG_REG) {
        EMIT_INST(AOP_ADD, a, b, &rarg[ZR]);
      } else if(b->type == ARG_IMM || b->type == ARG_LABEL) {
        if( b->type == ARG_LABEL || b->type == ARG_AT_LABEL) {
          b->value = 0xFFFF;
        }

        EMIT_INST(AOP_ADD, a, &rarg[ZR], &rarg[ZR]);
        uint16_t value = b->value;

        if(b->value & 0xFF00) {
          b->reftype = REF_UPPER;
          EMIT_INST(OP_ORI, a, b);
          arg.type = ARG_IMM;
          arg.value = 8;
          EMIT_INST(OP_SLI, a, a, &arg);
        }

        if(b->value & 0x00FF) {
          b->reftype = REF_LOWER;
          EMIT_INST(OP_ORI, a, b);
        }

        //if(b->value > 0) {
        //  if(b->value > 0xFF) {
        //    b->reftype = REF_UPPER;
        //    EMIT_INST(OP_ORI, a, b);
        //    arg.type = ARG_IMM;
        //    arg.value = 8;
        //    EMIT_INST(OP_SLI, a, a, &arg);
        //  }
        //}
      } else {
        assert(0);
      }
      break;

    case AOP_SLI:
      assert(a && a->type == ARG_REG);
      assert(b && b->type == ARG_REG);
      assert(c && c->type == ARG_IMM);
      EMIT_INST(OP_SLI, a, b, c);
      break;
    case AOP_SRI:
      assert(a && a->type == ARG_REG);
      assert(b && b->type == ARG_REG);
      assert(c && c->type == ARG_IMM);
      EMIT_INST(OP_SRI, a, b, c);
      break;
    case AOP_HALT:
      EMIT_INST(OP_HALT);
      break;
    case AOP_SUBI: /* for now this is our subtraction */
      assert(a && a->type == ARG_REG);
      assert(b && b->type == ARG_IMM);
      EMIT_INST(OP_NAND, a, a, a);
      EMIT_INST(OP_ADD,  a, a, b);
      EMIT_INST(OP_NAND, a, a, a);
      break;

    case AOP_NAND:
      EMIT_INST(OP_NAND, a, b, c);
      break;
    case AOP_AND:
      /* Lots of rooom for constant optimisation, to nand for example */
      if(c->type != ARG_REG) {
        EMIT_INST(AOP_MOV, &rarg[XR], c);
        c = &rarg[XR];
      }
      EMIT_INST(AOP_NAND, a, b, c);
      EMIT_INST(AOP_NOT,  a, a);
      break;
    case AOP_OR:
      EMIT_INST(AOP_NOT,  a,         b);
      EMIT_INST(AOP_NOT,  &rarg[XR], c);
      EMIT_INST(AOP_NAND, a, a, &rarg[XR]);
      break;
    case AOP_NOT: 
      EMIT_INST(AOP_NAND, a, b, b);
      break;
    case AOP_XOR:
      EMIT_INST(AOP_OR,   a,         b, c);
      EMIT_INST(AOP_NAND, &rarg[XR], b, c);
      EMIT_INST(AOP_AND,  a, a, &rarg[XR]);
      break;

    case AOP_PUSH:
      printf("type=%d\n" ,a->type);
      switch(a->type) {
      case ARG_REG:
        EMIT_INST(OP_STMR, a, a, &rarg[SP]);
        break;
      case ARG_REGLIST: {
        int first = 0;
        struct arg breg = { .value = a->reglist[first], .type = ARG_REG };
        struct arg ereg = { .value = a->reglist[first], .type = ARG_REG };

        for(int i = 1; i < a->reglist_len; ++i) {
          int reg = a->reglist[i];
          if(reg == ereg.value + 1) {
            ereg.value = reg;
          } else {
            EMIT_INST(OP_STMR, &breg, &ereg, &rarg[SP]);
            breg.value = reg;
            ereg.value = reg;
          }
        }
        EMIT_INST(OP_STMR, &breg, &ereg, &rarg[SP]);
      } break;
      default:
        assert(0);
      }
      break;
    case AOP_POP:
      switch(a->type) {
      case ARG_REG:
        EMIT_INST(OP_LDMR, a, a, &rarg[SP]);
        break;
      case ARG_REGLIST: {
        int first = a->reglist_len - 1;
        struct arg breg = { .value = a->reglist[first], .type = ARG_REG };
        struct arg ereg = { .value = a->reglist[first], .type = ARG_REG };

        for(int i = a->reglist_len - 2; i >= 0; --i) {
          int reg = a->reglist[i];
          if(reg == ereg.value - 1) {
            ereg.value = reg;
          } else {
            EMIT_INST(OP_LDMR, &breg, &ereg, &rarg[SP]);
            breg.value = reg;
            ereg.value = reg;
          }
        }
        EMIT_INST(OP_LDMR, &breg, &ereg, &rarg[SP]);

      } break;
      default:
        assert(0);
      }
      break;

    //case AOP_MUL:
    //  break;

    case AOP_NOP: 
      EMIT_INST(OP_ADD, &rarg[R0], &rarg[R0], &rarg[R0]);
      break;
#if 0
    case AOP_BL: {

        int mov_cnt = DO_EMIT_COUNT(opcode_map[AOP_MOV], &rarg[XR], &arg, NULL);
        int all_cnt = DO_EMIT_COUNT(desc, a, b, c);

        arg.type = ARG_IMM;
        arg.value = (all_cnt - mov_cnt + 1) * sizeof(u16);

        EMIT_INST(AOP_MOV, &rarg[XR], &arg);
        EMIT_INST(OP_ADD, &rarg[LR], &rarg[PC], &rarg[XR]);
        printf("mov=%d all=%d\n", mov_cnt, all_cnt);

        struct arg * jump_reg = NULL;
        if(a->type == ARG_REG) {
          jump_reg = &rarg[a->value]; // just = a???
        } else {
          EMIT_INST(AOP_MOV, &rarg[XR], a);
          jump_reg = &rarg[XR];
        }
        //EMIT_INST(OP_ADD, &rarg[LR], &rarg[LR], &arg);
        //EMIT_INST(OP_ADD, &rarg[PC], jump_reg, &rarg[ZR]);
        EMIT_INST(OP_BEQ, jump_reg, &rarg[ZR], &rarg[ZR]);
        break;
      }
    case AOP_BEQ:
      assert(a && a->type == ARG_REG && b && b->type == ARG_REG && c);
      if(c->type == ARG_IMM) {
        EMIT_INST(OP_ADD, &rarg[XR], &rarg[ZR], c);
        EMIT_INST(OP_BEQ, a, b, &rarg[XR]);
      } else {
        assert(c->type == ARG_REG);
        EMIT_INST(OP_BEQ, a, b, c);
      };
      break;
    case AOP_B:
      assert(a);
      if(a->type == ARG_LABEL) {
        EMIT_INST(AOP_MOV, &rarg[XR], a);
        EMIT_INST(OP_BEQ, &rarg[XR], &rarg[ZR], &rarg[ZR]);
      } else if(a->type == ARG_IMM) { 
        EMIT_INST(OP_ADD, &rarg[XR], &rarg[ZR], a);
        EMIT_INST(OP_BEQ, &rarg[XR], &rarg[ZR], &rarg[ZR]);
      } else {
        assert(a->type == ARG_REG);
        EMIT_INST(OP_BEQ, a, &rarg[ZR], &rarg[ZR]);
      }
      break;    
#else
    case AOP_B:
    case AOP_BL:
    case AOP_BEQ:
    case AOP_BLEQ:
      if(a->type != ARG_REG) {
        EMIT_INST(AOP_MOV, &rarg[XR], a);
        a = &rarg[XR];
      }
      arg.type = ARG_IMM;
      if(desc->op == AOP_BL)
        arg.value |= B_F_LINK;
      if(desc->op == AOP_BEQ)
        arg.value |= B_F_EQUAL;
      if(desc->op == AOP_BLEQ)
        arg.value |= B_F_LINK | B_F_EQUAL;
      EMIT_INST(OP_B, &arg, a);
      break;

#endif
    case AOP_CMP:
      EMIT_INST(AOP_SUB, &rarg[ZR], a, b);
      break;
    case DOP_PAD: 
      if(offset > a->value)
        fail("Invalid pad value");
      inst.word = 0;
      emit_data2(inst, (a->value - offset)/2);
      break;
    case DOP_DW:
      inst.word = a->value;
      emit_data(inst);
      break;
    case DOP_DS:
      assert(a->type == ARG_STR);
      char *str = strs[a->value];
      u16 len = strlen(str) + 1;
      len = (len >> 1) + 1;
      for(int i = 0; i < len; ++i) {
        inst.word = htons(*((u16*)str + i));
        emit_data(inst);
      }
      break;
    case DOP_GLOBAL:
      /* TODO */ 
      break;

    default:
      fail("unknown op");
    }
  }
}

// line    ::=
// line    ::=  stmt
// line    ::=  comment
// comment ::=  # ... \n
// stmt    ::=  <label>: [inst] [comment] \n
// inst    ::=  <opcode> [args...]
int lines = 1;

void stupid_call(){
  puts("");
}


#define FAIL(...) \
  do {\
    fflush(stdout);\
    fprintf(stderr, "%s:%d: ", __func__, __LINE__);\
    fprintf(stderr, __VA_ARGS__);\
    fprintf(stderr, "\n");\
    exit(-1);\
  } while(0)

struct parser {
  const char *filename;
  int line_no;
  const char *line;
  int line_len;
};

#define PARSE_FAIL(PARSER, BUF, LEN, ...)\
  do {\
    fprintf(stderr, "%s:%d: ",\
        (PARSER)->filename, (PARSER)->line_no);\
    fprintf(stderr, __VA_ARGS__);\
    fprintf(stderr, "\n");\
    fprintf(stderr, "  %.*s\n", \
        (PARSER)->line_len - 1, (PARSER)->line);\
    if(BUF) {\
      /* Make sure the buffer is within the line */\
      assert(\
          (BUF) >= (PARSER)->line && \
          (BUF) + (LEN) <= \
          (PARSER)->line + (PARSER)->line_len);\
      \
      fputs("  ", stderr);\
      for(const char *i = (PARSER->line);\
          i < (BUF) + (LEN); i++)\
      {\
        fputc(i < (BUF) ? ' ' : '^', stderr);\
      }\
      fputc('\n', stderr);\
    }\
    exit(-1);\
  } while(0)



void parse_line3(
    struct parser *parser, char *buf, int len)
{
  int toklen;
  char *tok;
  struct arg arg = {};
  struct inst inst = {};
  struct as as = {};
  struct inst_desc *desc;

  printf("%s %d: %.*s",__func__, lines++, len, buf);

  advance(&buf, &len, skip_space(buf, len));

  /* line ::= */
  if(len == 0) 
    return;

  /* line ::= # comment */
  if(buf[0] == '#') 
    return;

  /* line ::= <label>: ... */
  toklen = get_id(buf, len);
  if(toklen && toklen < len && buf[toklen] == ':') {
    struct troll16_sym *sym = sym_get(buf, toklen);

    if(sym->flags & TROLL_SYM_F_DEFINED) {
      PARSE_FAIL(parser, buf, toklen,
          "Label '%.*s' redefined", toklen, buf);
    }

    sym->flags |= TROLL_SYM_F_DEFINED;
    sym->value = offset;

    advance(&buf, &len, toklen + 1);
  }

  advance(&buf, &len, skip_space(buf, len));

  // inst ::=  <opcode> [args...]
  toklen = get_id(buf, len);
  if(toklen) {
    desc = opcode(buf, toklen);
    if(!desc)
      fail("Unknown opcode '%.*s'", toklen, buf);

    advance(&buf, &len, toklen);

    toklen = advance(&buf, &len, skip_space(buf, len));
    if(!toklen)
      PARSE_FAIL(parser, buf, 1,
          "No whitespace after opcode");

    int comma_skip_inc = -1;
    for(int i = 0; i < MAX_ARG; ++i) {
      if(getarg(&as.args[i], &buf, &len))
        break;

      if(!comma_skip_inc)
        PARSE_FAIL(parser, buf, 1,
            "Missing comma between arguments");
 
      comma_skip_inc = 
        advance(&buf, &len, skip_next_comma(buf, len));
    }

    as.desc = desc;
    do_emit_inst(desc, as.a + 0, as.a + 1, as.a + 2, NULL);
  }

  advance(&buf, &len, skip_space(buf, len));

  if(len) {
    /* line ::= ... # comment */
    if(buf[0] == '#') 
      return;

    PARSE_FAIL(parser, buf, len, "Trailing characters");
  }
}

void parse_line4(struct parser *parser, char *line)
{
  int comma;
  char *s,*e;
  struct inst_desc *desc;
  struct arg arg = {};
  struct inst inst = {};
  struct as as = {};

  s = line;
  while(isspace(*s))
    s++;
  if(*s == '#')
    return;

  e = get_id2(s);
  if(s != e && *e == ':') {
    struct troll16_sym *sym = sym_get(s, e - s);
    if(sym->flags & TROLL_SYM_F_DEFINED)
      fail( "Symbol redefined\n");
    sym->flags |= TROLL_SYM_F_DEFINED;
    sym->value = offset;
    s = e;
  }

  while(isspace(*s))
    s++;
  if(*s == '#')
    return;

  e = get_id2(s);
  if(s != e) {
    desc = opcode(s, e - s);
    if(!desc)
      fail("Unknown opcode");
    s = e;
  
    comma = 1;
    for(int i = 0; i < MAX_ARG; ++i) {
      while(isspace(*s))
        s++;
      if(*s == '#')
        break;
      e = getarg2(s, &as.args[i]);
      if(e == s)
        break;
      printf("ARG %.*s type %d\n", e-s,s,as.args[i].type);
      s = e;
      if(!comma)
        fail("NO comma between args");
      comma = 0;
      while(isspace(*s))
        s++;
      if(*s == ',') {
        comma = 1;
        s++;
      }
    }
    as.desc = desc;
    do_emit_inst(desc, as.a + 0, as.a + 1, as.a + 2, NULL);
  }
}



int ok(const char * filename)
{
  inst_arena = new_arena(ARENA_SIZE);

  int fd = open(filename, O_RDONLY);
  if(fd < 0) {
    fprintf(stderr, 
        "Failed to open assembly file '%s'.\n", filename);
    return -1;
  }

  for(int i = 0; i < NUM_R; ++i) {
    rarg[i].type = ARG_REG;
    rarg[i].value = i;
  }

  int i = 0;
  int sz;
  char *line;

  //asjcn
  struct parser parser = {
    .filename = filename
  };

  while((sz = read(fd, filebuf + i, FBUF_SZ - i) + i)) {
    line = filebuf;
    while(1) {
      for(; i < sz; ++i) {
        if(filebuf[i] == '\n')
          break;

        if(!isprint(filebuf[i]))
          fail("Nonprintable character");
      }

      if(i < sz) {
        assert(filebuf[i] == '\n');
        filebuf[i] = '\0';
        i += 1;
        parser.line = line;
        parser.line_len = i - (line - filebuf);
        parser.line_no++;
        printf("LINE: %s\n", line);
        parse_line4(&parser, line);
        //parse_line3(&parser, line, i - (line - filebuf));
        line = filebuf + i;
        continue;
      }

      // TODO: Thie check should be more general
      i = sz - (line - filebuf);
      if(i > (FBUF_SZ >> 1)) 
        fail("Line too long!\n");

      memmove(filebuf, line, i);
      break;
    }
  }
}

int main(int argc, char **argv) 
{
  int opt;
  int output_fd = -1;
  printf("lol\n");

  while((opt = getopt(argc, argv, "o:")) != -1) {
    printf("%c\n", opt);
    switch(opt) {
    case 'o':
      output_fd = open(optarg, O_WRONLY | O_TRUNC | O_CREAT, 0666);
      if(output_fd < 0)
        fail("Failed to open the output file");
      break;
    default:
      fail("Unknown option");
    }
  }

  if(output_fd < 0) 
    fail("No output file");

  for(; optind < argc; ++optind) {
    ok(argv[optind]);
  }

  struct troll_header troll_header = {
    .id[TROLL_ID_MAG0] = TROLL_MAG0,
    .id[TROLL_ID_MAG1] = TROLL_MAG1,
    .id[TROLL_ID_MAG2] = TROLL_MAG2,
    .id[TROLL_ID_MAG3] = TROLL_MAG3,
    .id[TROLL_ID_CLASS] = TROLL_16BIT,
    .id[TROLL_ID_DATA] = TROLL_2COMP_BIG_ENDIAN,
  };

  //struct troll_header troll_header = {
  //  .magic = {
  //    [0] = TROLLMAG0,
  //    [1] = TROLLMAG1,
  //    [2] = TROLLMAG2,
  //    [3] = TROLLMAG3,
  //  },
  //  .arch_bits = 1,
  //};
  write(output_fd, &troll_header, sizeof(struct troll_header));

  struct troll_shdr troll_section = {};
  if(symtab_arena) {
    troll_section.type = TROLL_SYMTAB;
    troll_section.size = arena_size(symtab_arena) + sizeof(struct troll_shdr);
    printf("SYMTAB 0x%lx %d\n", lseek(output_fd, 0, SEEK_CUR), troll_section.size);
    write(output_fd, &troll_section, sizeof(struct troll_shdr));
    arena_write(symtab_arena, output_fd);
  }

  if(strtab_arena) {
    troll_section.type = TROLL_STRTAB;
    troll_section.size = arena_size(strtab_arena) + sizeof(struct troll_shdr);
    printf("STRTAB 0x%lx %d\n", lseek(output_fd, 0, SEEK_CUR), troll_section.size);
    write(output_fd, &troll_section, sizeof(struct troll_shdr));
    arena_write(strtab_arena, output_fd);
  }

  if(reloca_arena) {
    troll_section.type = TROLL_RELOC;
    troll_section.size = arena_size(reloca_arena)+ sizeof(struct troll_shdr);
    printf("RELOC 0x%lx %d\n", lseek(output_fd, 0, SEEK_CUR), troll_section.size);
    write(output_fd, &troll_section, sizeof(struct troll_shdr));
    arena_write(reloca_arena, output_fd);
  }

  if(inst_arena) {
    troll_section.type = TROLL_CODE;
    troll_section.size = arena_size(inst_arena) + sizeof(struct troll_shdr);
    printf("CODE 0x%lx %d\n", lseek(output_fd, 0, SEEK_CUR), troll_section.size);
    write(output_fd, &troll_section, sizeof(struct troll_shdr));
    arena_write(inst_arena, output_fd);
  }

#if 0 
  for(int i = 0; i < labelidx; ++i) {
    printf("%04x %s = %04x\n", labels[i].addr, labels[i].name, labels[i].value);
  }
#endif


  {
    int all_count = 0;
    for(int i = 0; i < 16; ++i) 
      all_count += inst_count[i];
    if(all_count) {
      printf("Instruction count (%d)\n", all_count);
      for(int i = 0; i < 16; ++i) { 
        printf("%-10s %5d %5.1f%%\n", opcode_map[i].opcode, 
            inst_count[i], 100*(float)inst_count[i]/all_count);
      }
    }
  }

exit:
  //close(fd);
  close(output_fd);
}
