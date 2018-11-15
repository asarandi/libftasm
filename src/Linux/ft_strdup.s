extern malloc
global ft_strdup
default rel

section .text
ft_strdup:
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
	call	malloc wrt ..plt
	pop		rcx			;restore len + 1
	pop		rsi			;restore *src
	test	rax, rax	;did malloc return null?
	jz		ft_strdup_return
	mov		rdi, rax	;new mem will be *dst
	rep		movsb
ft_strdup_return:
	pop		rsi
	pop		rdi
	pop		rbp
	ret
