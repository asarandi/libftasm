%include "unistd_64.h.asm"
%include "my_const.asm"

;
;       arch/ABI      arg1  arg2  arg3  arg4  arg5  arg6  arg7  Notes
;       ──────────────────────────────────────────────────────────────
;       i386          ebx   ecx   edx   esi   edi   ebp   -
;       x86-64        rdi   rsi   rdx   r10   r8    r9    -
;

section	.data
	newLine		db	lf, 0

section	.text
	global	ft_bzero:function
	global	ft_isalnum:function
	global	ft_isalpha:function
	global	ft_isascii:function
	global	ft_isdigit:function
	global	ft_islower:function
	global	ft_isprint:function
	global	ft_isupper:function
	global	ft_puts:function
	global	ft_strcat:function
	global	ft_strlen:function
	global	ft_tolower:function
	global	ft_toupper:function
	global	ft_isspace:function
	global	ft_atoi:function

;--------------------------------------------------------------

ft_strlen:
	push	rsi
	push	rdi
	push	rcx

	xor	rcx, rcx
	mov	rsi, rdi

ft_strlen_loop:
	lodsb
	cmp	al, 0
	jz	ft_strlen_done
	inc	rcx
	jmp	ft_strlen_loop

ft_strlen_done:
	mov	rax, rcx

	pop	rcx
	pop	rdi
	pop	rsi
	ret

;--------------------------------------------------------------

ft_bzero:
	push	rax
	push	rcx
	push	rdi

	mov	rcx, rsi
	mov	al, 0
	rep	stosb

	pop	rdi
	pop	rcx
	pop	rax
	ret

;--------------------------------------------------------------

ft_strcat:
	push	rdi
	push	rsi

;	call ft_strlen
;	add	rdi, rax

	mov	al, 0
	repnz	scasb
	dec	rdi

ft_strcat_loop:
	lodsb
	stosb
	cmp	al, 0
	jnz	ft_strcat_loop

	pop	rsi
	pop	rdi

	mov	rax, rdi
	ret

;--------------------------------------------------------------

ft_isupper:
	xor	rax, rax
	cmp	rdi, 'A'
	jb	ft_isupper_return
	cmp	rdi, 'Z'
	ja	ft_isupper_return
	inc	rax
ft_isupper_return:
	ret

;--------------------------------------------------------------

ft_islower:
	xor	rax, rax
	cmp	rdi, 'a'
	jb	ft_islower_return
	cmp	rdi, 'z'
	ja	ft_islower_return
	inc	rax
ft_islower_return:
	ret

;--------------------------------------------------------------

ft_isalpha:
	push	rbx

	call ft_isupper
	mov	rbx, rax

	call ft_islower

	or	rax, rbx

	pop	rbx
	ret
	
;--------------------------------------------------------------

ft_isdigit:
	xor	rax, rax
	cmp	rdi, '0'
	jb	ft_isdigit_return
	cmp	rdi, '9'
	ja	ft_isdigit_return
	inc	rax
ft_isdigit_return:
	ret

;--------------------------------------------------------------

ft_isalnum:
	push	rbx
	call	ft_isalpha
	mov	rbx, rax
	call	ft_isdigit
	or	rax, rbx
	pop	rbx
	ret

;--------------------------------------------------------------

ft_isascii:
	xor	rax, rax
	cmp	rdi, 0x7f
	ja	ft_isascii_return
	inc	rax
ft_isascii_return:
	ret
;--------------------------------------------------------------

ft_isprint:
	xor	rax, rax
	cmp	rdi, 0x20
	jb	ft_isprint_return
	cmp	rdi, 0x7e
	ja	ft_isprint_return
	inc	rax
ft_isprint_return:
	ret

;--------------------------------------------------------------

ft_toupper:
	mov	rax, rdi
	cmp	rax, 'a'
	jb	ft_toupper_return
	cmp	rax, 'z'
	ja	ft_toupper_return
	sub	al, 'a' - 'A'
ft_toupper_return:
	ret

;--------------------------------------------------------------

ft_tolower:
	mov	rax, rdi
	cmp	rax, 'A'
	jb	ft_tolower_return
	cmp	rax, 'Z'
	ja	ft_tolower_return
	add	al, 'a' - 'A'
ft_tolower_return:
	ret

;--------------------------------------------------------------

ft_puts:
	push	rdi
	push	rsi
	push	rdx

	call ft_strlen
	mov	rdx, rax
	mov	rsi, rdi
	mov	rdi, STDOUT
	mov	rax, sys_write
	syscall

	mov	rdx, 1
	mov	rsi, newLine
	mov	rdi, STDOUT
	mov	rax, sys_write
	syscall

	pop	rdx
	pop	rsi
	pop	rdi
	ret

;--------------------------------------------------------------

ft_isspace:
	xor	rax, rax
	cmp	rdi, 0x20
	je	ft_isspace_positive
	cmp	rdi, 9
	jb	ft_isspace_return
	cmp	rdi, 13
	ja	ft_isspace_return
ft_isspace_positive:
	inc	rax
ft_isspace_return:
	ret

;--------------------------------------------------------------

ft_atoi:
	push	rdi
	push	rsi
	push	rbx
	push	rdx

	mov	rsi, rdi
	xor	rbx, rbx

ft_atoi_skip_spaces:
	lodsb
	cmp	al, 0
	jz	ft_atoi_done
	and	rax, 0xff
	mov	rdi, rax
	call ft_isspace
	cmp	rax, 1
	je	ft_atoi_skip_spaces

	xor	rdx, rdx	; will use rdx as a flag, clear for now
	dec	rsi
	cmp	byte [rsi], '-'
	jne	ft_atoi_no_minus_sign
	inc	rdx			; set negative flag
	inc	rsi
	jmp	ft_atoi_process_digits

ft_atoi_no_minus_sign:
	cmp	byte [rsi], '+'
	jne	ft_atoi_process_digits
	inc	rsi

ft_atoi_process_digits:
	lodsb
	cmp	al, 0
	jz	ft_atoi_no_more_digits
	and	rax, 0xff
	mov	rdi, rax
	call ft_isdigit
	cmp	rax, 1
	jne	ft_atoi_no_more_digits
	imul	rbx, rbx, 10
	sub	rdi, '0'
	add	rbx, rdi
	jmp	ft_atoi_process_digits

ft_atoi_no_more_digits:
	cmp	rdx, 0
	jz	ft_atoi_done
	xor	rdx, rdx
	sub	rdx, rbx
	mov	rbx, rdx

ft_atoi_done:
	pop	rdx
	mov	rax, rbx
	pop	rbx
	pop	rsi
	pop	rdi
	ret



;
;
;
;_start:
;
;	mov	rdi, hello
;	call ft_puts
;
;	mov	rdi, omg
;	mov	rsi, hello
;	call ft_strcat
;
;	call ft_puts
;
;	mov	rax, sys_exit
;	mov	rdi, EXIT_SUCCESS
;	syscall
;
;
