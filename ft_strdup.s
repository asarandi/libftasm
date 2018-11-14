global _ft_strdup

extern	_malloc

section .text

_ft_strdup:
	push	rbp
	mov		rbp, rsp
	push	rdi
	push	rsi
	push	rdi			;save *src
	xor		rax, rax
	mov		rcx, -1
	repnz	scasb
	sub		rax, rcx
	sub		rax, 1		;len + 1
	push	rax			;save
	mov		rdi, rax
	call	_malloc
	pop		rcx			;restore len + 1
	pop		rsi			;restore *src
	test	rax, rax	;did malloc return null?
	jz		_ft_strdup_return
	mov		rdi, rax	;new mem will be *dst
	rep		movsb
_ft_strdup_return:
	pop		rsi
	pop		rdi
	pop		rbp
	ret
