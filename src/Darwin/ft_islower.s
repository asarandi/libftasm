global _ft_islower

section .text

_ft_islower:
	xor		rax, rax
	cmp		rdi, 'a'
	jb		_ft_islower_return
	cmp		rdi, 'z'
	ja		_ft_islower_return
	inc		rax
_ft_islower_return:
	ret
