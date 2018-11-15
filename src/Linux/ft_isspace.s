global	ft_isspace
default	rel

section .text
ft_isspace:
	xor		rax, rax
	cmp		rdi, 0x20	;space ` '
	jz	ft_isspace_true
	cmp	rdi, 9			; 9 = `\t', 10 = `\n', 11 = `\v', 12 = `\f', 13 = `\r'
	jb	ft_isspace_return
	cmp	rdi, 13
	ja	ft_isspace_return
ft_isspace_true:
	inc	rax
ft_isspace_return:
	ret
