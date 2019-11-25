DDRB = 0x17
PORTB = 0x18
OCR0A = 0x29
TCCR0A = 0x2a
TCCR0B = 0x33
TIMSK = 0x39
STATUS = 0x3F

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
ldi r21, 4
out DDRB,r16
out OCR0A, r17
out TCCR0A, r18
out TCCR0B, r19
out TIMSK, r20
sei

loop:
tst r21
breq toggle
rjmp loop
toggle:
ldi r21, 4
eor r16, r1
out PORTB, r16
rjmp loop

timer0_compA:
in r22, STATUS
dec r21
out STATUS, r22
reti

bad:
rjmp reset
