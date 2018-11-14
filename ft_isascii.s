global _ft_isascii

section .text

_ft_isascii:
	xor		rax, rax
	cmp		rdi, 0x7f
	ja		_ft_isascii_return
	inc		rax
_ft_isascii_return:
	ret
