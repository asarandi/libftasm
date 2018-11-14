global _ft_cat

extern	_read, _write

section .data
	buf:	times 1024	db 0

section .text
_ft_cat:
	push	rbp
	mov		rbp, rsp
	push	rdi
	push	rsi
_ft_cat_loop:
	lea		rsi, [rel buf]
	mov		rdx, 1024
	call	_read
	cmp		rax, 1
	jl		_ft_cat_return	; 0 = eof, -1 = error
	mov		rdx, rax
	push	rdi				;save file descriptor for reading
	mov		rdi, 1
	lea		rsi, [rel buf]
	call	_write
	pop		rdi				;restore fd for reading
	cmp		rax, -1			;failed to write?
	jnz		_ft_cat_loop
_ft_cat_return:
	pop		rsi
	pop		rdi
	pop		rbp
	ret
