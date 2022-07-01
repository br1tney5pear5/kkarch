main:
        mov   sp, 0x1000
        mov   r2, string
        bl    print
        mov   r2, string
        bl    print
        mov   r2, string
        bl    print
        halt
  
print:
#        push    {lr, r1, r2, r3, r4, r5, r6, r7}
        mov     r1, zr 
        mov     r7, out
        mov     r6, 0xFFFF    # writout   
        mov     r5, 0xFF      # mask   
loop:
        lw      r3, r2        # Load 16 bit word
        mov     r4, r3
        sri     r4, r3, 8     # Get the high byte
        beq     r7, r4, 0
        sw      r6, r4        # Write higher byte
        and     r4, r3, r5    # Get the low byte
        beq     r7, r4, 0
        sw      r6, r4        # Write lower byte
        add     r2, r2, 2     # Move the index
        b       loop
out:
#        pop    {r7, r6, r5, r4, r3, r2, r1, lr}
        b       lr
        
        halt
#
#
#
##busyloop:
##        beq
#
string: .ds "Hello World\n"


