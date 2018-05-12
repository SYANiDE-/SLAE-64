section .text
global _start
_start:

	xor rax, rax
	push rax
	push rax
	push rax
	pop rsi
	pop rdx

	;  ssize_t read(int fd, void *buf, size_t count);
	mov al, byte [rsp+2]
	mov dil, al	
	push rsp
	pop rsi
	mov dl, 0x8
	syscall

	pop rcx
	push rcx
	push rcx
	push rcx
	pop rbx
	pop rdi
	mov cl, byte [plen]
stringcheck:
	mov al, byte [sil+bl]
	lea rdi, dword [password+bl]
	inc bl
	repne scasb
	jnz exit
	loop stringcheck

	xor rax, rax
	mov al, 0x1
	mov rdi, goodstr
	mov rsi, 0x4
	syscall
	
		

exit:
	mov al, 60
	xor rdi, rdi
	syscall



section .data
	password: db "sesame"
	plen: equ $-password
	goodstr:	db	"good"
