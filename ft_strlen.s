section .text
global _ft_strlen

_ft_strlen:
	xor rax, rax				; rax = 0
	.loop:						; bastante self explanatory
		cmp BYTE [rdi + rax], 0	; vamos comprobando que el char no sea \0
		je .end_loop			; de ser así, salimos del bucle
		inc	rax					; incrementamos el contador
		jmp .loop				; volvemos a loop
	.end_loop:					; dew
	ret							; see ya