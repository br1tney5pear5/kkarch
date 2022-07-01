main:   mov   sp, 0x1000
        mov   r2, string
        bl    print
        mov   r2, string
        bl    print
        halt

string: .ds "Hello World\n"
