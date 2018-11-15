global ft_isupper
default rel

section .text
ft_isupper:
	xor		rax, rax
	cmp		rdi, 'A'
	jb		ft_isupper_return
	cmp		rdi, 'Z'
	ja		ft_isupper_return
	inc		rax
ft_isupper_return:
	ret
