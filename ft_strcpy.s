section .text
global _ft_strcpy

_ft_strcpy:
	xor r15, r15
	.loop:
		cmp BYTE[rsi + r15], 0
		je .end_loop
		mov r8b, BYTE[rsi + r15]
		mov [rdi + r15], r8b
		inc r15
		jmp .loop
	.end_loop:
		mov BYTE[rdi + r15], 0
		mov rax, rdi
		ret