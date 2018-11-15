global ft_memcpy
default rel

section .text
ft_memcpy:
	push	rdi
	push	rsi
	push	rcx
	mov		rcx, rdx
	rep		movsb
	pop		rcx
	pop		rsi
	pop		rdi
	mov		rax, rdi
	ret
