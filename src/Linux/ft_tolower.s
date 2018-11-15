extern ft_isupper
global ft_tolower
default rel

section .text
ft_tolower:
	xor		rax, rax
	call	ft_isupper
	test	rax, rax
	mov		rax, rdi
	jz		ft_tolower_return
	add		rax, 0x20
ft_tolower_return:
	ret
