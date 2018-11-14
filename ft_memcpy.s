global _ft_memcpy

section .text

_ft_memcpy:
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
