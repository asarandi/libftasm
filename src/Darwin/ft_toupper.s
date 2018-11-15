global _ft_toupper
extern _ft_islower

section .text

_ft_toupper:
	xor		rax, rax
	call	_ft_islower
	test	rax, rax
	mov		rax, rdi
	jz		_ft_toupper_return
	sub		rax, 0x20
_ft_toupper_return:
	ret
