global	_ft_bzero

section .text

_ft_bzero:
	xor		rax, rax
_ft_bzero_loop:
	cmp		rax, rsi
	jae		_ft_bzero_done
	mov		byte [rdi + rax], 0
	inc		rax
	jmp		_ft_bzero_loop
_ft_bzero_done:
	ret
