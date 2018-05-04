section .text
global _start
_start:
	jmp relativity
	back: db "Hello World back!\n"

relativity:
	lea rsi, [rel back]
	sub rsi, 0x2
	mov qword RBX, 0x1010101010101010
	xor [rsi + 0x34], qword RBX
	xor rax, rax
	
	xor rax, rax
	times 4 push rax
	pop rbx
	pop rdx
	pop rdi
	add al, 1
	mov dil, 1

	add bl, 0x0a
	shl rbx, 32
	add rbx, 0x21646c72 			; \nr 
	push rbx
	mov rbx, 0x6f57206f6c6c6548 		; ow olleH
	push rbx
	lea rsi, [rsp]
	mov dl, 13
	syscall

	mov al, 60
	xor rdi, rdi
	syscall





	
