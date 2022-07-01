print:
        push    {lr, r1, r2, r3, r4, r5, r6, r7}
        mov     r1, zr 
        mov     r7, print_out
        mov     r6, 0xFFFF    # writout   
        mov     r5, 0xFF      # mask   
  print_loop:
        lw      r3, r2        # Load 16 bit word
        mov     r4, r3
        sri     r4, r3, 8     # Get the high byte
        beq     r7, r4, 0
        sw      r4, r6        # Write higher byte
        and     r4, r3, r5    # Get the low byte
        beq     r7, r4, 0
        sw      r4, r6        # Write higher byte
        add     r2, r2, 2     # Move the index
        b       print_loop
  print_out:
        pop    {r7, r6, r5, r4, r3, r2, r1, lr}
        b       lr
        halt



