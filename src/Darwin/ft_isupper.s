global	_ft_isupper

section .text

_ft_isupper:
	xor		rax, rax
	cmp		rdi, 'A'
	jb		_ft_isupper_return
	cmp		rdi, 'Z'
	ja		_ft_isupper_return
	inc		rax
_ft_isupper_return:
	ret
