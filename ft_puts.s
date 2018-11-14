global _ft_puts

extern	_ft_strlen

%include "os_specifics.s"

section .text

_ft_puts:
	xor		rax, rax
	call	_ft_strlen
	test	rax, rax
	jz		_ft_puts_nl
	mov		rdx, rax		;param 3, size_t nbyte
	mov		rsi, rdi		;param 2, const void *buf 
	mov		rdi, 1			;param 1, int fildes, 1=stdout
	mov		rax, SYS_write	;
	syscall
	cmp		rax, -1			;did it fail?
	jz		_ft_puts_done	;if yes, return
_ft_puts_nl:
	push	rax				;push #1, result of syscall
	mov		rdx, 1			;one byte only
	push	0x0a0a0a0a		;push #2, newlines
	mov		rsi, rsp		;we're gonna print stack =)
	mov		rdi, 1
	mov		rax, SYS_write
	syscall
	pop		rdi				;pop  newlines
	pop		rdi				;pop result of first syscall
	cmp		rax, -1
	jz		_ft_puts_done
	add		rax, rdi		;return sum of 2 syscalls
_ft_puts_done:
	ret
