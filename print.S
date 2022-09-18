        .global print
print:
        push    {lr, r1-r7}
        mov     r7, print_out
        mov     r6, 0xFFFF    # writout   
        mov     r5, 0xFF      # mask   
  print_loop:
        lw      r3, r1        # Load 16 bit word
        mov     r4, r3
        sri     r4, r3, 8     # Get the high byte
        cmp     r4, zr
        beq     r7
        sw      r4, r6        # Write higher byte
        and     r4, r3, r5    # Get the low byte
        cmp     r4, zr
        beq     r7
        sw      r4, r6        # Write higher byte
        add     r1, r1, 2     # Move the index
        b       print_loop
  print_out:
        pop     {pc, r1-r7}

