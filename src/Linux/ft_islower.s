global ft_islower
default rel

section .text
ft_islower:
	xor		rax, rax
	cmp		rdi, 'a'
	jb		ft_islower_return
	cmp		rdi, 'z'
	ja		ft_islower_return
	inc		rax
ft_islower_return:
	ret
