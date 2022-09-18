main:
        bl      setup
        mov     r1, string
        bl      print
        halt

string:
        .ds "Hello World!"


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


setup:
        mov     sp, 0x1000      # Set stack
        mov     r4, 0xFFF0      # interrupt vector table lets say
        mov     r3, isr 
        mov     r4, 0xFFF0
        sw      r3, r4          # Interrupt setup
        ori     fr, 0x2         # Enable interrupts
        b       lr
