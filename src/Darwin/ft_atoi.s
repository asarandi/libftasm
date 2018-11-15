extern _ft_isspace, _ft_isdigit
global _ft_atoi

_ft_atoi:
	push	rdi
	push	rsi
	push	rbx

	mov		rsi, rdi		; prepare for lodsb
	xor		rbx, rbx		; we'll use rbx to store the result

ft_atoi_skip_spaces:
	lodsb
	cmp		al, 0			;eol ?
	jz		ft_atoi_done
	and		rax, 0xff		;probably unnecessary
	mov		rdi, rax
	call	_ft_isspace
	cmp		rax, 1
	jz		ft_atoi_skip_spaces

	xor		rdx, rdx		; will use rdx as a flag, clear for now
	dec		rsi				; go to previous character
	cmp		byte [rsi], '-'	; string prefixed with minus sign?
	jnz		ft_atoi_no_minus_sign
	inc		rdx				; if yes, set negative flag
	inc		rsi				; go to next character
	jmp		ft_atoi_process_digits

ft_atoi_no_minus_sign:
	cmp		byte [rsi], '+'	; prefixed with plus?
	jnz		ft_atoi_process_digits
	inc		rsi				; increment

ft_atoi_process_digits:
	lodsb					; load character
	cmp		al, 0			; is eol?
	jz		ft_atoi_no_more_digits
	and		rax, 0xff		; again, probably unnecessary
	mov		rdi, rax		; put character in rdi for ft_isdigit
	call	_ft_isdigit
	cmp		rax, 1			; not a digit?
	jnz		ft_atoi_no_more_digits
	imul	rbx, rbx, 10	; signed multiply 
	sub		rdi, '0'		;
	add		rbx, rdi
	jmp		ft_atoi_process_digits

ft_atoi_no_more_digits:
	cmp		rdx, 0			; did we have negative flag set?
	jz		ft_atoi_done	; if not then, done
	xor		rdx, rdx		; set to 0
	sub		rdx, rbx		; flip sign by subtracting from 0
	mov		rbx, rdx

ft_atoi_done:
	mov		rax, rbx		; we return result in rax
	pop		rbx
	pop		rsi				; restore to original values
	pop		rdi
	ret
