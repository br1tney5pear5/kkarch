
#define ARENA_SIZE 1024

struct arena {
  struct arena *next;
  size_t size;
  size_t off;
  char data[];
};

//#define XALLOC_DEBUG 1

void * xalloc(void *ptr, size_t sz)
{
  if(!sz)  {
#ifdef XALLOC_DEBUG
    fprintf(stderr, "%s:free %p\n", __func__, ptr);
#endif
    ptr = (free(ptr), NULL);
    goto out;
  }

  if(!ptr) {
    ptr = memset(malloc(sz), 0, sz);
#ifdef XALLOC_DEBUG
    fprintf(stderr, "%s:alloc %p\n", __func__, ptr);
#endif
    goto out;
  }

  ptr = realloc(ptr, sz);
#ifdef XALLOC_DEBUG
  fprintf(stderr, "%s:realloc %p\n", __func__, ptr);
#endif
out:
  return ptr;
}

struct arena *new_arena(size_t size) 
{
  size = size + sizeof(struct arena);
  struct arena *arena = xalloc(NULL, size);
  assert(arena);
  arena->size = size;
  return arena;
}

#define MAX(A, B) ((A) < (B) ? (B) : (A))

void *arena_alloc(struct arena *arena, size_t size) 
{
  struct arena *prev = NULL;
  assert(arena);

  while(arena) {
    //printf("wanted: %zu, left: %zu\n", size, arena->size - arena->off);
    if(arena->size - arena->off >= size) {
      arena->off += size;
      return arena->data + arena->off - size;
    }
    arena = (prev = arena)->next;
  }
  arena = new_arena(MAX(ARENA_SIZE, size)); 

  if(prev)
    prev->next = arena;

  arena->off += size;
  return arena->data;
}

void arena_write(struct arena *arena, int fd) {
  for(; arena; arena = arena->next) {
    if(write(fd, arena->data, arena->off) != arena->off)
      fail("Failed to write");
  }
}

u16 arena_size(struct arena *arena)
{
  u16 size = 0;
  for(; arena; arena = arena->next)
    size += arena->off;
  return size;
}

void *arena_at(struct arena *arena, size_t off) 
{
  while(arena) {
    if(off < arena->off)
      return arena->data + off;

    off = off - arena->off;
    arena = arena->next;
  }
  return NULL;
}

int arena_offsetof(struct arena *arena, void *of) 
{
  int off = 0;
  while(arena) {
    if(arena->data <= (char*)of && (char*)of < (arena->data + arena->off))
      return off + ((char*)of - arena->data);

    off += arena->off;
    arena = arena->next;
  }
  return -1;
}


