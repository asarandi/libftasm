global _ft_strlen

section .text

_ft_strlen:
	xor		rax, rax
_ft_strlen_loop:
	cmp		byte [rdi + rax], 0
	jz		_ft_strlen_done
	inc		rax
	jmp		_ft_strlen_loop
_ft_strlen_done:
	ret
