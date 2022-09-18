main:
        bl      setup
        mov     r1, 7
        mov     r2, 5
        mov     r3, 0xCAFE 
        bl      multiply

#        mov     r1, string
#        bl      print
#
#back:   nop
#        b       back
        halt

        .global multiply
multiply:
        push    {lr}
        mov     r3, zr          # Zero the accumulator
        cmp     r2, zr          # Return if second operand is zero 
        beq     multiply_out
  multiply_loop:
        cmp     r1, zr          # Loop until the first operand is zero
        beq     multiply_out    
        add     r3, r3, r2      # Add second operand to the accumulator
        sub     r1, r1, 1       # Subtract one from the first operand
        b       multiply_loop
  multiply_out:
        mov     r1, r3
        pop     {pc}


string: .ds "Hello World! "

setup:
        mov     sp, 0x1000      # Set stack
        mov     r4, 0xFFF0      # interrupt vector table lets say
        mov     r3, isr 
        mov     r4, 0xFFF0
        sw      r3, r4          # Interrupt setup
        ori     fr, 0x2         # Enable interrupts
        b       lr

mul_isr: 
        push    {lr}
        mov     r4, zr
        cmp     r3, zr
        beq     mul_isr_out
  mul_isr_loop:
        cmp     r2, zr
        beq     mul_isr_out
        add     r4, r4, r3
        sub     r2, r2, 1
        b       mul_isr_loop
  mul_isr_out:
        pop     {pc}
        halt


do_isr_errmsg: 
        .ds "INVALID IRQ!"
do_isr:
        push    {lr, r1}
        cmp     r1, 0x0
        beq     do_isr_intr0
        cmp     r1, 0x1
        beq     do_isr_intr1
        # default
        mov     r1, do_isr_errmsg
        bl      print
        b       do_isr_out
  do_isr_intr0:
        # Keyboard interrupt
        mov     r1, 0xFFFF
        sw      r2, r1
        b       do_isr_out
  do_isr_intr1:
        bl      mul_isr
        b       do_isr_out
  do_isr_out:
        pop     {pc, r1}


        .global isr
isr:
        _xori   fr, 0x2         # Disable interrupts
        mov     sp, 0x5000      # Setup stack
        push    fr
        bl      do_isr
  isr_out:
        pop     fr
        _xori   fr, 0xa

#kbintr:
#        _xori   fr, 0x2         # Disable interrupts
#        mov     sp, 0x5000      # Set interrupt stack
#        fimov   r1, pc          # Save user's PC
#        fimov   r2, pc          # Save user's Stack
#        push    {r1, r2}        # Store both on interrupt's stack
#        mov     r1, kbintr_in
#        fomov   pc, r1
#        fomov   sp, sp
#        _xori   fr, 0x8
#kbintr_in:
#        push    {r1-r4, xr}
##_xori   fr, 0x2         # Enable interrupts
#
#        mov     r2, errmsg
#        bl      print
#
##_xori   fr, 0x2         # Disable interrupts
#        mov     r1, kbintr_out
#        fomov   pc, r1
#        pop     {r1-r4, xr}
#kbintr_out:
#
#        halt


#kbintr:
#        # The interrupt was invoked, therefore we know 
#        # that the IF flag must have been set.
#        _xori   fr, 0x2         # Disable interrupts
#        ori     fr, 0x8         # Use the second register bank
#        # The pc of the user process is saved in r7 (ilr)
#        mov     r5, xr          # Preserve user's xr
#        mov     r6, sp          # Preserve user's stack pointer
#        mov     sp, 0x5000      # Set interrupt stack (might clobber xr)
#        push    {r5, r6, r7}    # Free up the registers
#        mov     r2, errmsg   
#        bl      print
#        pop     {r5, r6, r7}    # Free up the registers
#        mov     sp, r6
#        mov     xr, r5
#        _xori   fr, 0x8         # Switch to normal registers
#        # FIXME!
#        _xori   fr, 0x2         # Enable interrupts
#        _freg   pc, r7
#        halt

#errmsg: .ds "INVALID IRQ!"
#
#
#ltoa_static:
#        .dw 100
#
#ltoa:
#        push    {lr, r1-r7}
##        mov     r1, 97
##        mov     r2, ltoa_static
##        sw      r2, r1
##        mov     r1, 98
##        add     r2, r2, 1
##        sw      r2, r1
##        mov     r1, 99
##        add     r2, r2, 1
##        sw      r2, r1
##        mov     r2, ltoa_static
##        bl      print
#        pop     {lr, r1-r7}
#        b       lr
#        
#        
#
#
#
#
#
#
#
##        mov     r2, errmsg
##        bl      print
##        _xori    fr, 0x8
##        _xori    fr, 0x2
#        halt
##        sw      xr, sp
##
##        push    {r1-r15}
##        halt
##        sw      lr, sp
##        add     sp, sp, 2
##        mov     r2, errmsg
##        bl      print
##        lw      lr, sp
##        sub     sp, sp, 2
##        b       lr
#        halt
##   
##   # Of course to not clobber the registers we want to save
##   # the address at to which registers are to be saved must 
##   # be passed on stack. Even still we have to do fair bit 
##   # of dancing to avoid clobbering.
##   #
##   # Note: only use base instructions so xr isn't changed.
##   #
##   # WIP
##   save_regs:
##           sw      xr, sp, zr
##           add     sp, sp, 2
##           push    {r1,r2,r3}
##   #        sw      lr, sp, -2
##   #        sw      r1, sp, -2
##   #        sw      r2, sp, -2
##   #        sw      r3, sp, -2
##   #        sw      r4, sp, -2
##   #        sw      r5, sp, -2
##   #        sw      r6, sp, -2
##   #        sw      r7, sp, -2
##   #        sw      r8, sp, -2
##   #        sw      r9, sp, -2
##   #        sw      r11, sp, 2
##   #        sw      r12, sp, 2
##   #        sw      r13, sp, 2
##   #        sw      r14, sp, 2
##   #        sw      r15, sp, 2
##   #        b       lr
##   
##   
