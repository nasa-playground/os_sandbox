puts:
	; stack flame
	push bp
	mov bp, sp

	; save register
	push ax
	push bx
	push si

	; get argument
	mov si, [bp + 4]

	; function
	mov ah, 0x0E
	mov bx, 0x0000
	cld

.Loop:
	lodsb

	cmp al, 0
	je .Exit

	int 0x10
	jmp .Loop

.Exit:
	; return register
	pop si
	pop bx
	pop ax

	; destroy stack flame
	mov sp, bp
	pop bp

	ret
