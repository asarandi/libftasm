global _ft_strcat

extern _ft_strlen, _ft_memcpy

section .text

_ft_strcat:
	push	rbp
	mov		rbp, rsp
	call	_ft_strlen
	push	rdi			;save destination
	add		rdi, rax
	xchg	rdi, rsi
	call	_ft_strlen
	xchg	rdi, rsi
	inc		rax
	mov		rdx, rax
	call	_ft_memcpy
	pop		rax			;restore destination
	pop		rbp
	ret
