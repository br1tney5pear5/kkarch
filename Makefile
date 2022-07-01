ld: ld.c
	gcc -g ld.c -o ld

.PHONY: as
as: as.c
	gcc -g as.c -o as
	
.PHONY: em
em: em.c 
	gcc -g em.c -lncurses -o em
all:
	gcc -g as.c -o as && gcc -g em.c -o em
