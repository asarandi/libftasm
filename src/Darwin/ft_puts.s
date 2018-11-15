global _ft_puts

extern	_ft_strlen, _write

SYS_write	equ	0x2000004	;macos64 specific

section .text

_ft_puts:
	push	rbp
	mov		rbp, rsp
	xor		rax, rax
	call	_ft_strlen
	test	rax, rax
	jz		_ft_puts_nl
	mov		rdx, rax		;param 3, size_t nbyte
	mov		rsi, rdi		;param 2, const void *buf 
	mov		rdi, 1			;param 1, int fildes, 1=stdout
	call	_write
	cmp		rax, -1			;did it fail?
	jz		_ft_puts_done	;if yes, return
_ft_puts_nl:
	push	rax				;push #1, result of write
	mov		rax, 0x0a0a0a0a
	push	rax
	mov		rdx, 1			;one byte only
	mov		rsi, rsp		;we're gonna print stack =)
	mov		rdi, 1			;stdout
	call	_write
	pop		rdi				;pop  newlines
	pop		rdi				;pop result of first write
	cmp		rax, -1
	jz		_ft_puts_done
	add		rax, rdi		;return sum of 2 writes
_ft_puts_done:
	pop		rbp
	ret
