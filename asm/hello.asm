;	NAME
;	STUDENT NUMBER
;	PROGRAM NAME

section .data

hello_string:
	db "Hello, World!", 0x0a
hello_length	equ	14
	
section .bss

a_byte:
	resb	1	;yes

section .text
	global _start

_start:	
	nop

	; TODO: your code here

	mov	eax, 4	; write()
	mov	ebx, 1	; STDOUT
	mov	ecx, hello_string
	mov	edx, hello_length
	int	0x80

	; exit
	mov	eax, 1	; exit()
	mov	ebx, 0
	int	0x80

