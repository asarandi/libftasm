global ft_memset
default rel

section .text
ft_memset:
	push	rdi
	push	rcx
	mov		rcx, rdx
	mov		rax, rsi
	rep		stosb
	pop		rcx
	pop		rdi
	mov		rax, rdi
	ret
