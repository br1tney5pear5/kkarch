main:
        bl      setup
back:   mov     r2, string
        bl      print
        b       back
        halt

#string: .ds "Hello World! "
string: .ds "HW"

setup:
        mov     sp, 0x1000      # Set stack
#        mov     r3, kbintr 
#        mov     r4, 0xFFF0
#        sw      r3, r4          # Interrupt setup
#        ori     fr, 0x2         # Enable interrupts
        b       lr

kbintr:
        # The interrupt was invoked, therefore we know 
        # that the IF flag must have been set.
        _xori   fr, 0x2         # Disable interrupts
        ori     fr, 0x8         # Use the second register bank
        # The pc of the user process is saved in r7 (ilr)
        mov     r5, xr          # Preserve user's xr
        mov     r6, sp          # Preserve user's stack pointer
        mov     sp, 0x5000      # Set interrupt stack (might clobber xr)
        push    {r5, r6, r7}    # Free up the registers
        mov     r2, errmsg   
        bl      print
        pop     {r5, r6, r7}    # Free up the registers
        mov     sp, r6
        mov     xr, r5
        _xori   fr, 0x8         # Switch to normal registers
        # FIXME!
        _xori   fr, 0x2         # Enable interrupts
        _freg   pc, r7
        halt

errmsg: .ds "_INTR_"


ltoa_static:
        .dw 100

ltoa:
        push    {lr, r1-r7}
#        mov     r1, 97
#        mov     r2, ltoa_static
#        sw      r2, r1
#        mov     r1, 98
#        add     r2, r2, 1
#        sw      r2, r1
#        mov     r1, 99
#        add     r2, r2, 1
#        sw      r2, r1
#        mov     r2, ltoa_static
#        bl      print
        pop     {lr, r1-r7}
        b       lr
        
        







#        mov     r2, errmsg
#        bl      print
#        _xori    fr, 0x8
#        _xori    fr, 0x2
        halt
#        sw      xr, sp
#
#        push    {r1-r15}
#        halt
#        sw      lr, sp
#        add     sp, sp, 2
#        mov     r2, errmsg
#        bl      print
#        lw      lr, sp
#        sub     sp, sp, 2
#        b       lr
        halt
#   
#   # Of course to not clobber the registers we want to save
#   # the address at to which registers are to be saved must 
#   # be passed on stack. Even still we have to do fair bit 
#   # of dancing to avoid clobbering.
#   #
#   # Note: only use base instructions so xr isn't changed.
#   #
#   # WIP
#   save_regs:
#           sw      xr, sp, zr
#           add     sp, sp, 2
#           push    {r1,r2,r3}
#   #        sw      lr, sp, -2
#   #        sw      r1, sp, -2
#   #        sw      r2, sp, -2
#   #        sw      r3, sp, -2
#   #        sw      r4, sp, -2
#   #        sw      r5, sp, -2
#   #        sw      r6, sp, -2
#   #        sw      r7, sp, -2
#   #        sw      r8, sp, -2
#   #        sw      r9, sp, -2
#   #        sw      r11, sp, 2
#   #        sw      r12, sp, 2
#   #        sw      r13, sp, 2
#   #        sw      r14, sp, 2
#   #        sw      r15, sp, 2
#   #        b       lr
#   
#   
