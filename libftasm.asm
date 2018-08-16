%include "unistd_64.h.asm"
%include "my_const.asm"

;
;       arch/ABI      arg1  arg2  arg3  arg4  arg5  arg6  arg7  Notes
;       ──────────────────────────────────────────────────────────────
;       i386          ebx   ecx   edx   esi   edi   ebp   -
;       x86-64        rdi   rsi   rdx   r10   r8    r9    -
;
;
;###################################################
;
; as per ft_mytest
;
;	arg1	arg2	arg3	arg4	arg5	arg6
;	rdi,	rsi,	rdx,	rcx,	 r8,	r9
;
;

section	.data
	myBuffer	db	0, 0, 0, 0, 0, 0, 0, 0


section	.text
	global	ft_bzero:function
	global	ft_memset:function
	global	ft_memcpy:function
	global	ft_isalnum:function
	global	ft_isalpha:function
	global	ft_isascii:function
	global	ft_isdigit:function
	global	ft_islower:function
	global	ft_isprint:function
	global	ft_isupper:function
	global	ft_putchar:function
	global	ft_puts:function
	global	ft_strcat:function
	global	ft_strlen:function
	global	ft_tolower:function
	global	ft_toupper:function
	global	ft_isspace:function
	global	ft_atoi:function
	global	ft_mytest:function

ft_mytest:
	inc	rax
	dec	rax
	ret

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
; rdi, rsi, rdx
; rdi = void *s, rsi = int c, rdx = size_t n

ft_memset:
	push	rdi
	push	rcx

	mov	rcx, rdx	;size_t n
	mov	rax, rsi	;int c
	rep	stosb		;put al in [rdi], decrement rcx, repeat while rcx > 0

	pop	rcx
	pop	rdi
	mov	rax, rdi	;return pointer to memory area s (rdi)
	ret


;--------------------------------------------------------------
; rdi, rsi, rdx
; rdi = void *dest, rsi = const void *src, rdx = size_t n

ft_memcpy:
	push	rdi
	push	rsi
	push	rcx

	mov	rcx, rdx	;size_t n

	rep	movsb		;while (rcx)
					;move one byte from rsi to rdi,
					;increment rsi rdi, decrement rcx

	pop	rcx
	pop	rsi
	pop	rdi
	mov	rax, rdi	;return *dest
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

ft_putchar:
	push	rdi	; <<-- byte to be written to stdout
	push	rsi
	push	rdx

	mov		rax, rdi
;	and		rax, 0xff
	mov		rsi, myBuffer
	mov		[rsi], al	; <<-- put one byte at beginning of buffer
	mov		rdx, 1		; <<-- how many bytes to write
	mov		rdi, STDOUT	; <<-- where to write
	mov		rax, sys_write
	syscall
	cmp		rax, 1
	je		ft_putchar_success
	mov		rax, EOF	; <<-- putchar returns EOF on error
	jmp		ft_putchar_return
ft_putchar_success:
	mov		al, byte [rsi]
	and		rax, 0xff

ft_putchar_return:
	pop	rdx
	pop	rsi
	pop	rdi
	ret



;
; per debian manpage for puts, it must return a non-negative int or EOF on error
; here we'll use r12 as a counter and return number of bytes written, why not?
; it should always be at least 1 (lf)
;

ft_puts:
	push	rdi
	push	rsi
	push	rdx
	push	r12

	mov		rsi, rdi
	xor		r12, r12
ft_puts_loop:
	lodsb
	cmp	al, 0
	jz	ft_puts_no_more_bytes
	and	rax, 0xff
	mov	rdi, rax
	call ft_putchar
	cmp	rax, EOF		; return EOF on fail
	je	ft_puts_return
	inc	r12				; increment counter
	jmp	ft_puts_loop
ft_puts_no_more_bytes:
	mov	rdi, LF
	call ft_putchar
	cmp	rax, EOF
	je	ft_puts_return	; eof on fail
	inc	r12
	mov	rax, r12		; return number of bytes written
						; note: some puts implementations return 1 or true ..
ft_puts_return:
	pop	r12
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
