do_isr_errmsg: 
        .ds "INVALID IRQ!"
do_isr:
        push    {lr, r1}
        cmp     r1, 0x0
        beq     do_isr_intr0
        # default
        mov     r1, do_isr_errmsg
        bl      print
        b       do_isr_out
  do_isr_intr0:
        # Keyboard interrupt
        mov     r1, 0xFFFF
        sw      r2, r1
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
