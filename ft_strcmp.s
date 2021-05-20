section .text
global _ft_strcmp

_ft_strcmp:
	xor r15,r15
	.loop:

		;cmp BYTE[rdi + r15], 0
		;je .end_loop
		;cmp BYTE[rsi + r15], 0
		;je .end_loop
		mov al, BYTE[rdi + r15]
		cmp al, BYTE[rsi + r15];cmp BYTE[rdi + r15], BYTE[rsi + r15]
		jne	.differ


		cmp al, 0
		je .differ

		cmp BYTE[rsi + r15], 0
		je .differ

		inc r15
		jmp .loop
		
	.differ:
		;previo
		;mov al, BYTE[rdi + r15]
		;sub al, BYTE[rsi + r15]
		;previo
		; comprar un value con otro cmp jne -> mov rax, -1 || 1 ; je -> mov rax, 0

		cmp al, BYTE[rsi, + r15]
		je .equal
		jl .menor

		; cmp y si es mayor al o BYTE...  -> -1?
		;cmp al, BYTE[rsi + r15] ; no es necesario hacer dos cmp se puede hacer seguido


		mov rax, 1
		ret 


	.menor:
	mov rax, -1
	ret

	.equal:
	mov rax, 0
	ret

	;.end_loop:
	;	xor rax, rax
	;	ret
