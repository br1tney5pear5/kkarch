#include "kkarch.h"

struct header {
  u8 magic[4];
};

enum {
  ELF16_SYMTAB,
};

struct section {
  u8 type;



  u8 data[];
};
