global _ft_isprint

section .text

_ft_isprint:
	xor		rax, rax
	cmp		rdi, 0x20
	jb		_ft_isprint_return
	cmp		rdi, 0x7e
	ja		_ft_isprint_return
	inc		rax
_ft_isprint_return:
	ret
