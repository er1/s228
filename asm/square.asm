section .data
	nl	db	10
	
section .bss
	savedDword	resd	1
	savedByte	resb	1

	inputBufferSize	equ	10
	inputBuffer	resb	inputBufferSize
	inputBufferEnd:

	outputBufferSize	equ	10
	outputBuffer	resb	outputBufferSize
	outputBufferEnd:

section .text
	global _start

_start:	
	nop
	
	; get operand1
	call	get_num
	; number is in eax

	; eax = eax * eax
	mul	eax

	; print number in eax
	call put_num

	; print newline
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, nl
	mov	edx, 1
	int	0x80

exit:
	mov	eax, 1
	mov	ebx, 0
	int	0x80

; GET_NUM
; read a string and return its converted value into EAX

get_num:
	; input into buffer
	mov	eax, 3
	mov	ebx, 0
	mov	ecx, inputBuffer
	mov	edx, inputBufferSize
	int	0x80
	; eax = length of string

	; make esi the start of the string
	mov	esi, inputBuffer 
	; make edi the end of the string
	mov	edi, inputBuffer
	add	edi, eax	
	dec	edi

	mov	eax, 0

get_num_loop:
	mov	edx, 10
	mul	edx	; edx:eax = eax * operand

	mov	edx, 0
	mov	dl, [esi]
	sub	dl, 0x30
	inc	esi

	add	eax, edx

	cmp	esi, edi
	jne	get_num_loop

	ret	; eax = inputed value

; PRINT_NUM
; print out the value in eax as a decimal number

put_num:
	; point to the end of the buffer
	mov	edi, outputBufferEnd

put_num_loop:
	; move one characer left
	dec	edi

	; set up division
	mov	edx, 0
	mov	ebx, 10
	div	ebx	; eax = edx:eax / ebx, remainder in edx
	
	; put the remainder on the buffer
	add	dl, 0x30 ; make it ASCII first
	mov	[edi], dl

	; if after the above division, eax != 0, continue to loop, otherwise exit the loop
	cmp	eax, 0
	jne	put_num_loop
	
	; set up registers and make system call
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, edi
	mov	edx, outputBufferEnd
	sub	edx, edi
	int	0x80

	ret

