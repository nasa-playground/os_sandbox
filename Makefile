boot:
	./tools/nasm src/boot.s -o boot.img -l boot.lst
	qemu-system-i386 boot.img
