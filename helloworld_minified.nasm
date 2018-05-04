global _start
section .text
_start:
	jmp call_sc
sc:
	pop rsi
	xor rax, rax	
	add al, 1
	mov rdi, rax
	xor rdx, rdx
	add dl, 13
 	syscall

 	mov al, 60
 	mov dil, 1
 	syscall
	
call_sc:
	call sc
	hwstr:	db	"Hello World!", 0x0a


