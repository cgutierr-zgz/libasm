section .text
extern ___error
global _ft_read

;0x2000003 ; read en MAC
_ft_read:
	mov rax, 0x2000003 ; pues eso
	
	syscall
	jc error
	ret
error:
	push rax;pa no perder el value porque error me lo va a sobreescribir
	
	call ___error ;ahora rax es el puntero a errno

	pop rdx
	mov [rax], rdx

	mov rax, -1
	ret