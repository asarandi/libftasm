global ft_strlen
default rel

section .text
ft_strlen:
	push	rdi
	push	rcx
	xor		rax, rax
	mov		rcx, -1
	repnz	scasb
	add		rcx, 2
	sub		rax, rcx
	pop		rcx
	pop		rdi
	ret
