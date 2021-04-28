section .text
global _ft_strlen

_ft_strlen:
	xor rax, rax ; rax = 0
	.loop:
		cmp BYTE [rdi + rax], 0
		je .end_loop
		inc	rax
		jmp .loop
	.end_loop:
	ret