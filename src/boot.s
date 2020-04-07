%include "./src/macros/cdecl.s"

BOOT_LOAD equ 0x7C00
ORG BOOT_LOAD

entry:
	jmp ipl

	; bios parameter block
	times 90 - ( $ - $$ ) db 0x90


ipl:
	cli ; 割り込み禁止命令

	mov ax, 0x0000
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, BOOT_LOAD

	sti ; 割り込み許可

	mov [BOOT.DRIVE], dl

	cdecl putc, word 'A'
	cdecl putc, word 'B'
	cdecl putc, word 'C'

	jmp $

ALIGN 2, db 0
BOOT:
.DRIVE: dw 0

%include "./src/modules/puts.s"

times 510 - ( $ - $$ ) db 0x00
db 0x55, 0xAA

