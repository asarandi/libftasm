extern ft_strlen, ft_memcpy
global ft_strcat
default rel

section .text
ft_strcat:
	push	rbp
	mov		rbp, rsp
	call	ft_strlen
	push	rdi			;save destination
	add		rdi, rax
	xchg	rdi, rsi
	call	ft_strlen
	xchg	rdi, rsi
	inc		rax
	mov		rdx, rax
	call	ft_memcpy
	pop		rax			;restore destination
	pop		rbp
	ret
