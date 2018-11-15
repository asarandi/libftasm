global _ft_tolower
extern _ft_isupper

section .text

_ft_tolower:
	xor		rax, rax
	call	_ft_isupper
	test	rax, rax
	mov		rax, rdi
	jz		_ft_tolower_return
	add		rax, 0x20
_ft_tolower_return:
	ret
