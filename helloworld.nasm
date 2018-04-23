section .text
global _start
_start:
	
	mov rax, 1
	mov rdi, 1
	mov rsi, hwstr
	mov rdx, hwstrlen
	syscall

	; exit
	mov rax, 60
	mov rdi, 1
	syscall
	

section .data
	hwstr:	db	"Hello World!", 0x0a
	hwstrlen:	equ 	$-hwstr
