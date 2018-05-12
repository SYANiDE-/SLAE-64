section .text
global _start
_start:

	jmp runtime
	goodstr:	db	"good", 0x0a
runtime:
	lea rsi, [rel goodstr]
	xor rax, rax
	push rax
	push rax
	pop rdi
	pop rdx
        mov al, 0x1
	mov dl, 0x5
        syscall

	mov al, 60
	mov dil, 0x1
	syscall	
