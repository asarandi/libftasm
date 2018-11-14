global _ft_memset

section .text

_ft_memset:
	xor		rax, rax
_ft_memset_loop:
	cmp		rax, rdx
	jae		_ft_memset_return
	mov		byte [rdi + rax], sil
	inc		rax
	jmp		_ft_memset_loop
_ft_memset_return:
	mov		rax, rdi
	ret
