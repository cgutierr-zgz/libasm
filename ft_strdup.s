section .text
extern malloc
global _ft_strdup

_ft_strdup:
	xor r15, r15
	.loop:
	cmp BYTE[rsi + r15], 0
	je .end_loop
	mov al, BYTE[rsi + r15]

	inc r15
	jmp .loop

	.end_loop:
	syscall malloc
	

ret