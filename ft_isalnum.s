global _ft_isalnum
extern _ft_isalpha, _ft_isdigit

section .text

_ft_isalnum:
	call	_ft_isalpha
	test	rax, rax
	jnz		_ft_isalnum_return
	call	_ft_isdigit
_ft_isalnum_return:
	ret
