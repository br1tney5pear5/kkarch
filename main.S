main:
        bl      setup
back:   mov     r2, string
        b       back
        halt

string: .ds "Hello World! "

setup:
        mov     sp, 0x1000
        mov     r3, kbintr
        mov     r4, 0xFFF0
        sw      r3, r4
        b       lr

kbintr:
        sw      lr, sp
        add     sp, sp, 2
        mov     r2, errmsg
        bl      print
        lw      lr, sp
        sub     sp, sp, 2
        b       lr
        halt

errmsg: .ds "INTR."
