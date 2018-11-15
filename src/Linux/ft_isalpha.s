extern ft_isupper, ft_islower
global ft_isalpha
default rel

section .text
ft_isalpha:
	call	ft_isupper
	test	rax, rax
	jnz		ft_isalpha_return
	call	ft_islower
ft_isalpha_return:
	ret
