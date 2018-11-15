extern _malloc, _ft_strdup
global _ft_itoa
default rel

section .data
	neg:	db 0
	buf:	times 254 db 0

section .text
_ft_itoa:
	push	rbp
	mov		rbp, rsp
	push	rdi
	push	rsi

	mov		byte [rel + neg], 0
	and		rdi, 0xffffffff
	mov		rax, rdi
	cmp		rdi, 0x7fffffff
	jle		ft_itoa_not_negative
	mov		byte [rel + neg], 1
	mov		rax, 0xffffffff
	sub		rax, rdi
	inc		rax
ft_itoa_not_negative:
	lea		rdi, [rel + buf + 128]
	mov		byte [rdi], 0
	mov		rcx, 10
ft_itoa_loop:
	dec		rdi
	xor		rdx, rdx
	idiv	rcx
	add		rdx, 0x30	; '0'
	mov		byte [rdi], dl
	test	rax, rax
	jnz		ft_itoa_loop
	cmp		byte [rel + neg], 1
	jnz		ft_itoa_strdup
	dec		rdi
	mov		byte [rdi], '-'
ft_itoa_strdup:
	call	_ft_strdup
	pop		rsi
	pop		rdi
	pop		rbp
	ret
	

