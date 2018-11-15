global ft_isascii
default rel

section .text
ft_isascii:
	xor		rax, rax
	cmp		rdi, 0x7f
	ja		ft_isascii_return
	inc		rax
ft_isascii_return:
	ret
