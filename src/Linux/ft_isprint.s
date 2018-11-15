global ft_isprint
default rel

section .text
ft_isprint:
	xor		rax, rax
	cmp		rdi, 0x20
	jb		ft_isprint_return
	cmp		rdi, 0x7e
	ja		ft_isprint_return
	inc		rax
ft_isprint_return:
	ret
