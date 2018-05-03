; string_rev_stack.py -a 'for i in $(seq 0 30); do echo "Hello World! #$i"; done  ' -X 
; author:  Chase Hatch
; prints "Hello World! #n" where n is iterated number 0 through 30

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
	mov rbx, qword 0x2020656e6f64203b 	;  ;;enod ; 
	push rbx
	mov rbx, qword 0x226924232021646c 	;  "i$# !dl 
	push rbx
	mov rbx, qword 0x726f57206f6c6c65 	;  roW olle 
	push rbx
	mov rbx, qword 0x4822206f68636520 	;  H" ohce  
	push rbx
	mov rbx, qword 0x6f64203b29303320 	;  od ;)03  
	push rbx
	mov rbx, qword 0x3020716573282420 	;  0 qes($  
	push rbx
	mov rbx, qword 0x6e69206920726f66 	;  ni i rof
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



	
