all: tiny.hex

tiny.elf: tiny.s
	avr-gcc tiny.s -nostartfiles -nodefaultlibs -o tiny.elf

tiny.hex: tiny.elf
	avr-objcopy  tiny.elf tiny.hex -O ihex

flash: tiny.hex
	sudo avrdude -C ~/avrdude.conf -c linuxspi -pattiny85 -P /dev/spidev0.0 -U flash:w:tiny.hex:i

clean:
	rm tiny.elf tiny.hex
