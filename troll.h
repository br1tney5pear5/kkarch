#ifndef _TROLL_H_
#define _TROLL_H_

typedef u8  troll_u8_t;
typedef u16 troll16_addr_t;
typedef u16 troll16_word_t;
typedef u16 troll16_off_t;
typedef u16 troll16_size_t;


#define __TROLL_PACKED  __attribute__((packed))

enum {
  TROLL_ID_MAG0         = 0,
  TROLL_ID_MAG1         = 1,
  TROLL_ID_MAG2         = 2,
  TROLL_ID_MAG3         = 3,
  TROLL_ID_CLASS        = 4,
  TROLL_ID_DATA         = 5,
  TROLL_ID_VERSION      = 6,

  TROLL_ID_SIZE             = 8,
};

#define TROLL_MAG0 0x7f
#define TROLL_MAG1 'T'
#define TROLL_MAG2 'R'
#define TROLL_MAG3 'L'
#define TROLL_16BIT 1
#define TROLL_32BIT 2 /* unimplemented... */
#define TROLL_64BIT 3 /* unimplemented... */
#define TROLL_2COMP_BIG_ENDIAN 1

enum {
  TROLL_T_NONE   = 0,
  TROLL_T_REL    = 1,
  TROLL_T_EXEC   = 2,
};

struct troll_header {
  troll_u8_t id[TROLL_ID_SIZE];
  troll_u8_t type;
} __TROLL_PACKED;

#define TROLL_ARCH_BITS_16BIT 1

static inline
int troll_check_header(struct troll_header *hdr) 
{
  if( hdr->id[TROLL_ID_MAG0] != TROLL_MAG0 || 
      hdr->id[TROLL_ID_MAG1] != TROLL_MAG1 || 
      hdr->id[TROLL_ID_MAG2] != TROLL_MAG2 || 
      hdr->id[TROLL_ID_MAG3] != TROLL_MAG3)
    return 0;

  return 1;
}

enum {
  REF_FULL,
  REF_LOWER,
  REF_UPPER,
};

enum {
  TROLL_CODE,
  TROLL_STRTAB,
  TROLL_SYMTAB,
  TROLL_RELOC,
};

struct troll_shdr {
  u8 type;
  u16 size;
  u8 data[];
} __TROLL_PACKED;



struct troll_reloc {
  int symoff;
  int offset;
  int reftype;
  troll_u8_t flags;
} __TROLL_PACKED;




#define TROLL_RELOCA_T_XMACRO     \
  X(TROLL_RELOCA_T_NONE)          \
  X(TROLL_RELOCA_T_GENERIC_LO8)   \
  X(TROLL_RELOCA_T_GENERIC_HI8)   \
  X(TROLL_RELOCA_T_GENERIC_HIPC8) \
  X(TROLL_RELOCA_T_GENERIC_LOPC8) \

enum {
#define X(T) T,
  TROLL_RELOCA_T_XMACRO
#undef X
//  TROLL_RELOCA_T_NONE,
//  TROLL_RELOCA_T_GENERIC_LO8,
//  TROLL_RELOCA_T_GENERIC_HI8,
//  TROLL_RELOCA_T_GENERIC_HIPC8,
//  TROLL_RELOCA_T_GENERIC_LOPC8,
};

const char *troll_reloca_type_cstr(int i)
{
  switch(i) {
#define X(T) case T: return #T;
    TROLL_RELOCA_T_XMACRO
#undef X
  }
  return "???";
}

struct troll16_reloca {
  troll16_size_t sym;
  troll16_off_t offset;
  troll16_off_t addend;
  troll_u8_t type;
} __TROLL_PACKED;

#if 0  
enum {
/*  GLOBAL
 *  LOCAL
 *  UNDEFINED
 *  ...*/
};
#endif

enum {
  TROLL_SYM_T_NONE,
  TROLL_SYM_T_FUNC,
};

enum {
  TROLL_SYM_F_DEFINED = (1 << 0),
};

struct troll16_sym {
  troll16_off_t name;
  troll16_addr_t value;
  troll_u8_t type;
  troll_u8_t flags;
  // size
} __TROLL_PACKED;

static inline
void hexdump (
    const char * desc,
    const void * addr,
    const int len,
    const int n
) {
    int i;
    unsigned char buff[n+1];
    const unsigned char * pc = (const unsigned char *)addr;
    if (desc != NULL) printf ("%s:\n", desc);
    if (len == 0) {
        printf("  ZERO LENGTH\n");
        return;
    }
    if (len < 0) {
        printf("  NEGATIVE LENGTH: %d\n", len);
        return;
    }
    for (i = 0; i < len; i++) {
        if ((i % n) == 0) {
            if (i != 0) printf ("  %s\n", buff);
            printf ("  %04x ", i);
        }
        printf (" %02x", pc[i]);
        if ((pc[i] < 0x20) || (pc[i] > 0x7e)) // isprint() may be better.
            buff[i % n] = '.';
        else
            buff[i % n] = pc[i];
        buff[(i % n) + 1] = '\0';
    }
    while ((i % n) != 0) {
        printf ("   ");
        i++;
    }
    printf ("  %s\n", buff);
}

// Very simple test harness.

#endif /* _TROLL_H_ */
