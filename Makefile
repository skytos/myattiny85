all: tiny.hex

tiny.o: tiny.s
	avr-gcc tiny.s -nostartfiles -c -o tiny.o

tiny.elf: tiny.o
	avr-ld tiny.o -o tiny.elf

tiny.hex: tiny.elf
	avr-objcopy  tiny.elf tiny.hex -O ihex

flash: tiny.hex
	sudo avrdude -C ~/avrdude.conf -c linuxspi -pattiny85 -P /dev/spidev0.0 -U flash:w:tiny.hex:i
