global	ft_bzero
default rel

section .text
ft_bzero:
	xor		rax, rax
ft_bzero_loop:
	cmp		rax, rsi
	jae		ft_bzero_done
	mov		byte [rdi + rax], 0
	inc		rax
	jmp		ft_bzero_loop
ft_bzero_done:
	ret
