;	NAME
;	STUDENT NUMBER
;	PROGRAM NAME

section .data
	
section .bss

section .text
	global _start

_start:	
	nop

	; TODO: your code here

	; exit
	mov	eax, 1
	mov	ebx, 0
	int	0x80
