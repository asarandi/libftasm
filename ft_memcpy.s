global _ft_memcpy

section .text

_ft_memcpy:
	xor		rax, rax
_ft_memcpy_loop:
	cmp		rax, rdx
	jae		_ft_memcpy_return
	mov		cl, byte [rsi + rax]
	mov		byte [rdi + rax], cl
	inc		rax
	jmp		_ft_memcpy_loop
_ft_memcpy_return:
	mov		rax, rdi
	ret
