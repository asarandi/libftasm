extern ft_isalpha, ft_isdigit
global ft_isalnum
default rel

section .text
ft_isalnum:
	call	ft_isalpha
	test	rax, rax
	jnz		ft_isalnum_return
	call	ft_isdigit
ft_isalnum_return:
	ret
