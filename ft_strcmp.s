section .text
global _ft_strcmp

_ft_strcmp:
	xor r15,r15
	.loop:

		;cmp BYTE[rdi + r15], 0
		;je .end_loop
		;cmp BYTE[rsi + r15], 0
		;je .end_loop


		;mov al, BYTE[rdi + r15]
		;cmp al, 0
		;je .differ
		;cmp BYTE[rsi + r15], 0
		;je .differ


		cmp al, BYTE[rsi + r15];cmp BYTE[rdi + r15], BYTE[rsi + r15]
		jne	.differ

		inc r15
		jmp .loop
		
	.differ:
		mov al, BYTE[rdi + r15]
		sub al, BYTE[rsi + r15]
		
		ret 

	;.end_loop:
	;	xor rax, rax
	;	ret