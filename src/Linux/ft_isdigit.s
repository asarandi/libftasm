global ft_isdigit
default rel

section .text
ft_isdigit:
	xor		rax, rax
	cmp		rdi, 0x30	;'0'
	jb		ft_isdigit_return
	cmp		rdi, 0x39	;'9'
	ja		ft_isdigit_return
	inc		rax
ft_isdigit_return:
	ret
