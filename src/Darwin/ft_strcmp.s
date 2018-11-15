global _ft_strcmp
default rel

section .text
_ft_strcmp:
	push	rdi
	push	rsi
	xor		rcx, rcx
ft_strcmp_loop:
	mov		al, byte [rdi + rcx]
	mov		dl, byte [rsi + rcx]
	inc		rcx
	test	al, al	
	jz		ft_strcmp_return
	test	dl, dl
	jz		ft_strcmp_return
	cmp		al, dl
	jz		ft_strcmp_loop
ft_strcmp_return:
	sub		al, dl
	movsx	rax, al
	pop		rsi
	pop		rdi
	ret
