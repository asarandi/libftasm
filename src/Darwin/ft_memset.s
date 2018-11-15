global _ft_memset

section .text

_ft_memset:
	push	rdi
	push	rcx
	mov		rcx, rdx
	mov		rax, rsi
	rep		stosb
	pop		rcx
	pop		rdi
	mov		rax, rdi
	ret
