;	Eric Chan
;	936xxxx
;	ROT13 Encryptor / Decryptor

section .data
	
section .bss

buffer:
	resb	80
length:
	resd	1

section .text
	global _start

_start:	
	nop

	; read string
	mov	eax, 3
	mov	ebx, 0
	mov	ecx, buffer
	mov	edx, 80
	int	0x80
	mov	[length], eax

	mov	ecx, 0
loop:
	cmp	ecx, [length]
	je	done

	; read char
	mov	dl, [buffer + ecx]
	and	dl, 11011111b ; toUppercase
	mov	dh, 13

;if (...) {...} elseif (...) {...} else {}	

	cmp	dl, 65
	jl	elseif
	cmp	dl, 78
	jge	elseif

	add	[buffer + ecx], dh

	jmp	endif
elseif:
	cmp	dl, 78
	jl	else
	cmp	dl, 91
	jge	else

	sub	[buffer + ecx], dh

	jmp	endif
else:
	nop	; do nothing
endif:


	inc	ecx
	jmp	loop
done:
	
	; write string
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, buffer
	mov	edx, [length]
	int	0x80

	; exit
	mov	eax, 1
	mov	ebx, 0
	int	0x80
