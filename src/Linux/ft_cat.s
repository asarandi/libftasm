extern	read, write
global ft_cat
default rel

section .data
	fildes:	dq 0
	buffer:	times 1024	db 0

section .text
ft_cat:
	push	rbp
	mov		rbp, rsp
	push	rdi
	push	rsi
	mov		[rel fildes], rdi
ft_cat_loop:
	lea		rsi, [rel buffer]
	mov		rdx, 1024
	call	read wrt ..plt
	cmp		rax, 1
	jl		ft_cat_return	; 0 = eof, -1 = error
	mov		rdx, rax
	mov		rdi, 1
	lea		rsi, [rel buffer]
	call	write wrt ..plt
	mov		rdi, [rel fildes]
	cmp		rax, -1			;failed to write?
	jnz		ft_cat_loop
ft_cat_return:
	pop		rsi
	pop		rdi
	pop		rbp
	ret
