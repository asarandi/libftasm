extern	ft_strlen, write
global ft_puts
default rel

section .data
	res1:	dq 0
	nl:		db 10

section .text
ft_puts:
	push	rbp
	mov		rbp, rsp
	xor		rax, rax
	call	ft_strlen
	test	rax, rax
	jz		ft_puts_nl
	mov		rdx, rax		;param 3, size_t nbyte
	mov		rsi, rdi		;param 2, const void *buf 
	mov		rdi, 1			;param 1, int fildes, 1=stdout
	call	write wrt ..plt
	cmp		rax, -1			;did it fail?
	jz		ft_puts_done	;if yes, return
ft_puts_nl:
	mov		[rel + res1], rax
	mov		rdx, 1			;one byte only
	lea		rsi, [rel + nl]
	mov		rdi, 1			;stdout
	call	write wrt ..plt
	cmp		rax, -1
	jz		ft_puts_done
	add		rax, [rel + res1]	;return sum of 2 writes
ft_puts_done:
	pop		rbp
	ret
