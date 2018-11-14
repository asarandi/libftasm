global _ft_isalpha

extern _ft_isupper, _ft_islower

section .text

_ft_isalpha:
	call	_ft_isupper
	test	al, al
	jnz		_ft_isalpha_return
	call	_ft_islower
_ft_isalpha_return:
	ret
