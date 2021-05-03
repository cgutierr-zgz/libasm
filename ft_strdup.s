section .text
extern _malloc
extern _ft_strlen
global _ft_strdup

_ft_strdup:
	; obtener la longitud
	; hacer malloc de esa longitud + 1 para \0
	; copiar el contenido src [x] a dest [x]
	call _ft_strlen
	; en rax tengo la longitud
	inc rax
	push rdi
	mov rdi, rax

	call _malloc
	pop rdi
	xor r15, r15

	

	.loop:
	cmp BYTE[rdi + r15], 0
	je .end_loop
	mov r8b ,BYTE[rdi + r15] 
	mov BYTE[rax + r15],r8b; copiamos el contenido 


	inc	r15 
	jmp .loop

	.end_loop:
	;poner el 0 final 
	mov BYTE[rax + r15], 0



ret