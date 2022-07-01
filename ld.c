
#include "arch.h"
#include "troll.h"
#include "arena.h"
#include <unistd.h>


struct arena *arena = NULL;

int global_offset = 0;

int output_fd = -1;

struct object {
  struct object *next;

  const char *filename;

  int filesize;
  void *filebuf;

  struct troll_shdr *code_sect;
  struct troll_shdr *reloca_sect;
  struct troll_shdr *strtab_sect;
  struct troll_shdr *symtab_sect;
  
  int offset;
};

struct symbol {
  struct symbol *next;
  struct object *obj;
  int symoff;
};



int open_object(const char *filename) 
{
  static struct object *prev = NULL;
  if(!arena)
    arena = new_arena(1024);

  int fd = open(filename, O_RDONLY);
  if(fd < 0)
    return -1;

  struct object *obj = arena_alloc(arena, sizeof(struct object));
  memset(obj, 0, sizeof(*obj));
  obj->filesize = lseek(fd, 0, SEEK_END);
  obj->filebuf = arena_alloc(arena, obj->filesize);
  lseek(fd, 0, SEEK_SET);

  obj->offset = global_offset;

  if(obj->filesize != read(fd, obj->filebuf, obj->filesize))
    return -2;

  struct troll_header *troll_header = obj->filebuf;
  if(!troll_check_header(troll_header))
    return -3;

  struct troll_shdr *section = 
    (void*)((char*)obj->filebuf + sizeof(struct troll_header));

  hexdump("0x83 offs", (char*)obj->filebuf + 0x83, 16, 16);

  for(int i = 0; i < 4; ++i) {
    switch(section->type) {
    case TROLL_CODE: 
      printf("code_sect 0x%x\n", (char*)section - (char*)obj->filebuf);
      obj->code_sect = section; break;
    case TROLL_SYMTAB: 
      printf("symtab_sect 0x%x\n", (char*)section - (char*)obj->filebuf);
      obj->symtab_sect = section; break;
    case TROLL_STRTAB: 
      printf("strtab_sect 0x%x\n", (char*)section - (char*)obj->filebuf);
      obj->strtab_sect = section; break;
    case TROLL_RELOC: 
      printf("reloca_sect 0x%x\n", (char*)section - (char*)obj->filebuf);
      obj->reloca_sect = section; break;
    default: return -4;
    }
    // TODO checks
    section = (void*)((char*)section + section->size);
  }
  assert(obj->code_sect);
  assert(obj->symtab_sect);
  assert(obj->strtab_sect);
  assert(obj->reloca_sect);
  printf("obj->strtab_sect->size = %d\n", obj->strtab_sect->size);

  global_offset += obj->code_sect->size;

  if(prev) 
    prev->next = obj;

  prev = obj;

  struct troll16_reloca *reloca = (void*)obj->reloca_sect->data;
  struct troll16_reloca *reloca_end = 
    (void*)(obj->reloca_sect->data + obj->reloca_sect->size);

  while(reloca < reloca_end) {
    ///char *name = arena_at(strtab_arena, lkp->name);
    ///int lkp_len = strlen(name);
    ///// printf("CMP %d '%.*s' '%s' %d\n", len, len, str, name, lkp_len);

    ///if(lkp_len == len && !memcmp(str, name, len))
    ///  return lkp;
    //
    hexdump("reloca", reloca, sizeof(*reloca), 16);

    //printf("reloca->sym = %zu\n", reloca->sym);
    //printf("reloca->addr = %zu\n", reloca->offset);
    //printf("reloca->addr = %zu\n", reloca->addend);

    if(reloca->sym < obj->strtab_sect->size) {
      printf("reloca->sym = %zu\n", reloca->sym);
      printf("RELOCATING %s %s\n", 
          obj->strtab_sect->data + reloca->sym, 
          troll_reloca_type_cstr(reloca->type) );

      struct troll16_sym *sym = (void*)obj->symtab_sect->data;
      struct troll16_sym *sym_end = 
        (void*)(obj->symtab_sect->data + obj->symtab_sect->size); 

      while(sym < sym_end) {
        if(sym->name == reloca->sym)
          break;
        sym++;
      }

      if(sym == sym_end)
        fail("No symtab entry for that symbol");

      printf("sym = %p, %04x\n", sym, sym->value);

      uint8_t *code = (void*)obj->code_sect->data; 

      hexdump("before:", code + reloca->offset - 1, 4, 16);

      switch(reloca->type) {
        case TROLL_RELOCA_T_GENERIC_HI8:
          code[reloca->offset] = (uint8_t)((sym->value & 0xFF00) >> 16);
          break;
        case TROLL_RELOCA_T_GENERIC_LO8:
          code[reloca->offset] = (uint8_t)(sym->value & 0x00FF);
          break;
        default:
          fail("NOT HANDLED");
      }

      hexdump("after:", code + reloca->offset - 1, 4, 16);
    }

    reloca++;
  }
#if 0
  for(int i = 0; 
      i < (obj->reloca_sect->size - sizeof(struct troll_shdr))
      /sizeof(struct troll_reloc);
      ++i)
  {
    struct troll_reloc *reloc = 
      ((struct troll_reloc *)obj->reloca_sect->data) + i;

    const char *reftype_str = "???";

    switch(reloc->reftype) {
      case REF_FULL:  reftype_str = "full"; break;
      case REF_LOWER: reftype_str = "lower"; break;
      case REF_UPPER: reftype_str = "upper"; break;
    }

    printf("%s addr=%04x val=%04x %s\n", 
        obj->symtab_sect->data + reloc->symoff, 
        reloc->offset, 0,
        reftype_str);
  }
#endif

  write(output_fd, obj->code_sect->data, obj->code_sect->size);

  //hexdump("code:", obj->code_sect->data, obj->code_sect->size, 16);
  return 0;
}


int main(int argc, char **argv) 
{
  int opt;

  while((opt = getopt(argc, argv, "o:")) != -1) {
    switch(opt) {
    case 'o':
      output_fd = open(optarg, O_WRONLY | O_TRUNC | O_CREAT);
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
    int rc = open_object(argv[optind]);
    if(rc)
      fail("Failed to open the object file '%s' %d", argv[optind], rc);
  }
  close(output_fd);

  return 0;
}
