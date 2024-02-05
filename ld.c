#include "arch.h"
#include "troll.h"
#include "arena.h"
#include <unistd.h>

struct arena *arena = NULL;

int global_offset = START;

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
struct object *objects = NULL;

struct symbol {
  struct symbol *next;
  struct object *obj;
  int symoff;
};


//int open_object(const char *filename)
//{
//}
//

int open_object(const char *filename) 
{
  printf(RED "open_object %s\n" RESET, filename);
  static struct object *prev = NULL;
  if(!arena)
    arena = new_arena(1024);

  int fd = open(filename, O_RDONLY);
  if(fd < 0) {
    printf("open %s %d\n", filename, fd);
    return -1;
  }

  struct object *obj = arena_alloc(arena, sizeof(struct object));
  if(!objects)
    objects = obj;

  memset(obj, 0, sizeof(*obj));
  obj->filename = filename; /* FIXME */
  obj->filesize = lseek(fd, 0, SEEK_END);
  obj->filebuf = arena_alloc(arena, obj->filesize);
  lseek(fd, 0, SEEK_SET);

  obj->offset = global_offset;
  printf("obj->offset %d\n", obj->offset);

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
  printf("obj->code_sect->size = %d\n", obj->code_sect->size);
  global_offset += obj->code_sect->size;
  printf("global_offset=%d\n", global_offset);

  if(prev) 
    prev->next = obj;

  prev = obj;

  struct troll16_reloca *reloca = (void*)obj->reloca_sect->data;
  struct troll16_reloca *reloca_end = 
    (void*)(obj->reloca_sect->data + obj->reloca_sect->size);
  do {
    struct troll16_reloca *reloca = (void*)obj->reloca_sect->data;
    struct troll16_reloca *reloca_end = 
      (void*)(obj->reloca_sect->data + obj->reloca_sect->size);
    while(reloca < reloca_end) {
      if(reloca->sym < obj->symtab_sect->size) {

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

        printf(YELLOW "reloca %s %s %08x\n" RESET, 
          obj->strtab_sect->data + reloca->sym, 
          troll_reloca_type_cstr(reloca->type), 
          sym->value);

      } else {
        printf("WTF");
        //assert(0);
      }
      reloca++;
    }
  } while(0);


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

  //write(output_fd, obj->code_sect->data, obj->code_sect->size);

  //hexdump("code:", obj->code_sect->data, obj->code_sect->size, 16);
  return 0;
}

#define SECTION_DATA_END(SECT)\
    (void*)((SECT)->data + ((SECT)->size - sizeof(*SECT))); 

struct troll16_sym *find_sym(const char *symname, struct object **symobj) 
{
  for(struct object *obj = objects; obj; obj = obj->next) {
    struct troll16_sym *sym = (void*)obj->symtab_sect->data;
    struct troll16_sym *sym_end = SECTION_DATA_END(obj->symtab_sect);

    while(sym < sym_end) {
      assert(sym->name < obj->strtab_sect->size);
      const char *lkp_symname = (void*)(obj->strtab_sect->data + sym->name);
      printf("%d %d %s\n", sym->name, obj->strtab_sect->size, lkp_symname);
      if((sym->flags & TROLL_SYM_F_DEFINED) && !strcmp(symname, lkp_symname)) {
        printf("found sym %s in %s name=%d size=%d\n", 
             lkp_symname, obj->filename, sym->name, obj->strtab_sect->size);
        *symobj = obj;
        return sym;
      }
      sym++;
    }
  }
  return NULL;
}

int dolink(void)
{
  for(struct object *obj = objects; obj; obj = obj->next) {
    struct troll16_reloca *reloca = (void*)obj->reloca_sect->data;
    struct troll16_reloca *reloca_end = SECTION_DATA_END(obj->reloca_sect);
    while(reloca < reloca_end) {
      const char *symname = obj->strtab_sect->data + reloca->sym;
      printf("reloca %s\n", symname);
      struct object *symobj = NULL;
      struct troll16_sym *sym = find_sym(symname, &symobj);
      printf("  got %p\n", sym);
      assert(sym);

      uint8_t *code = (void*)obj->code_sect->data; 
      uint16_t value = sym->value + symobj->offset;
      assert(value >= sym->value); /* overflow */
      printf(GREEN "%s: Reloc %s at %08x to %04x\n" RESET, 
          obj->filename, troll_reloca_type_cstr(reloca->type),
          reloca->offset, value);

      switch(reloca->type) {
        case TROLL_RELOCA_T_GENERIC_HI8:
          printf(GREEN "reloca %s offset %d = %02x\n" RESET, 
              symname, reloca->offset, (uint8_t)(value >> 8));
          code[reloca->offset] = (uint8_t)(value >> 8);
          break;
        case TROLL_RELOCA_T_GENERIC_LO8:
          printf(GREEN "reloca %s offset %d = %02x\n" RESET, 
              symname, reloca->offset, (uint8_t)(uint8_t)(value & 0xff));
          code[reloca->offset] = (uint8_t)(value & 0xff);
          break;
        default:
          fail("not handled");
      }
      reloca++;
    }
  }
#if 0
  while(reloca < reloca_end) {
    ///char *name = arena_at(strtab_arena, lkp->name);
    ///int lkp_len = strlen(name);
    ///// printf("CMP %d '%.*s' '%s' %d\n", len, len, str, name, lkp_len);

    ///if(lkp_len == len && !memcmp(str, name, len))
    ///  return lkp;
    //
    hexdump("reloca", reloca, sizeof(*reloca), 16);

    printf("reloca->sym = %zu\n", reloca->sym);
    printf("reloca->addr = %zu\n", reloca->offset);
    printf("reloca->addr = %zu\n", reloca->addend);

    if(reloca->sym < obj->strtab_sect->size) {
      printf("reloca->sym = %zu\n", reloca->sym);
      printf(YELLOW "RELOCATING %s %s\n" RESET, 
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
        fail("no symtab entry for that symbol");

      printf("sym = %p, %04x\n", sym, sym->value);

      uint8_t *code = (void*)obj->code_sect->data; 

      hexdump("before:", code + reloca->offset - 1, 4, 16);


      hexdump("after:", code + reloca->offset - 1, 4, 16);
    } else {
      assert(0);
    }

    reloca++;
  }
#endif
}


int main(int argc, char **argv) 
{
  int opt;

  while((opt = getopt(argc, argv, "o:")) != -1) {
    switch(opt) {
    case 'o':
      output_fd = open(optarg, O_WRONLY | O_TRUNC | O_CREAT, 0666);

      printf("open %s %d\n", optarg, output_fd);
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
  dolink();

  for(struct object *obj = objects; obj; obj = obj->next) {
    write(output_fd, obj->code_sect->data, obj->code_sect->size);
  }

  close(output_fd);

  return 0;
}
