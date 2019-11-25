DDRB = 0x17
PORTB = 0x18
OCR0A = 0x29
TCCR0A = 0x2a
TCCR0B = 0x33
TIMSK = 0x39

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
rjmp timer0_compA
rjmp bad
rjmp bad
rjmp bad
rjmp bad

reset:

ldi r16, 1
mov r1, r16
ldi r17, 244
ldi r18, 2
ldi r19, 5
ldi r20, 16
out DDRB,r16
out OCR0A, r17
out TCCR0A, r18
out TCCR0B, r19
out TIMSK, r20
sei

loop:
out PORTB, r16
rjmp loop

timer0_compA:
eor r16, r1
reti

bad:
rjmp reset
