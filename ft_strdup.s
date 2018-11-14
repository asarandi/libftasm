global _ft_strdup

extern	_ft_strlen, _ft_memcpy, _malloc

section .text

_ft_strdup:
	push	rbp
	mov		rbp, rsp
	push	rdi			;save *str
	call	_ft_strlen
	inc		rax			;len + 1
	mov		rdi, rax	;malloc, 1st parameter
	push	rdi			;save len + 1
	call	_malloc
	pop		rdx			;restore len + 1
	pop		rsi			;restore *str
	test	rax, rax	;did malloc return null?
	jz		_ft_strdup_return
	mov		rdi, rax	;fresh mem will be *dst for memcpy
	call	_ft_memcpy
_ft_strdup_return:
	pop		rbp
	ret
