_start:
rjmp reset
rjmp bad
rjmp bad
rjmp bad
rjmp bad
rjmp bad
rjmp bad
rjmp bad
rjmp bad
rjmp bad
rjmp bad
rjmp bad
rjmp bad
rjmp bad
rjmp bad

reset:
ldi r16, 1
out 0x17, r16
out 0x18, r16
done:
rjmp done

bad:
rjmp reset
