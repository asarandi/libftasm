extern ft_islower
global ft_toupper
default rel

section .text
ft_toupper:
	xor		rax, rax
	call	ft_islower
	test	rax, rax
	mov		rax, rdi
	jz		ft_toupper_return
	sub		rax, 0x20
ft_toupper_return:
	ret
