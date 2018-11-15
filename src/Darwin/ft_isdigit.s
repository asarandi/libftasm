global _ft_isdigit

section .text

_ft_isdigit:
	xor		rax, rax
	cmp		rdi, 0x30	;'0'
	jb		_ft_isdigit_return
	cmp		rdi, 0x39	;'9'
	ja		_ft_isdigit_return
	inc		rax
_ft_isdigit_return:
	ret
