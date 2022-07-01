# this is comment
# this is comment
# this is comment
# this is comment
label:
        halt
vector: .dw 0x200
# main:   .dw 0x200
stack:  .dw 0x1000
write:  .dw 0xffff
string: .ds "Hello World\n"

        .pad 32
start:  
        movi    sp, @stack
        movi    r1, main
        bl      r1
        halt

        push    {lr, r1, r2, r3, r4, r5}

        movi    r2, @write      # write memory
print_loop:
        lw      r4, r1
        movi    r5, 0xFF
        and     r5, r4, r5      # mask off upper
        beq     r0, r5, r0
        sw      r5, r2
        sri     r4, r4, 8
        beq     r0, r4, r0
        sw      r4, r2
        addi    r1, 2
        movi    r8, print_loop
        mov     pc, r8

        pop     {r5, r4, r3, r2, r1, pc}

hexdump:
        push    {lr, r1, r2}

        movi    r1, 'a'
        movi    r4, @write
        sw      r1, r4
        beq     r0, r0, r0

        pop     {r2, r1, pc}

#        .pad @main
main:
        push    {lr}
        movi    r1, string
        movi    r5, print
        bl      r5
        pop     {lr}
        mov     pc, lr




## Testing program kkarch
##main:
##        mov     r1, string
##        mov     r2, print
##        bl print
##        halt
#string:
##print:
##  push lr
##        push r1
##        push r2
##        push r3
##movi r3, 0xffff
#        mov     r1, @string
##lw   r2, r1
##       Make sure this doesn't parse
##        lw ,'x', r2,
#
##        pop r2
##        pop r1
##        pop pc
##        pop {r4,r3,r2,r1,pc}
##write:  .dw 0xffff
