section .text
global _start
_start:

	jmp getstr
cp1:
	pop rdi
	xor rax, rax
	mov [rdi+9], byte ah
	mov [rdi+10], rdi	;bbbbbbbb
	jmp getarg
cp2:
	pop rbx
	mov [rdi+18], rbx	;cccccccc
	mov [rbx+2], byte ah
	jmp getcmd
cp3:
	pop rbx
	mov [rdi+26], rbx	;dddddddd
	mov [rbx+55], byte ah
	mov [rdi+34], rax	;eeeeeeee
	lea rsi, [rdi+10]
	lea rdx, [rdi+34]
	add al, 59
	syscall


getstr:
	call cp1
	prog: 	db	"/bin/bashABBBBBBBBCCCCCCCCddddddddeeeeeeee"
getarg:
	call cp2
	arg:	db	'-cA'
getcmd:
	call cp3
	cmd:	db	'for i in $(seq 1 30); do echo "[$i] Hello World!"; doneA'

