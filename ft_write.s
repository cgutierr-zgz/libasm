section .text
extern ___error
global _ft_write
;0x2000004
_ft_write:
	mov rax, 0x2000004
	syscall ; si syscall falla, activa el carry
	
	jc error;error;si el carry esta activado ; jc es si jump condicional y jmp es jump por mis cojones
	ret
error:
	push rax
	;sub	rsp, 8
	call ___error
	;add rsp, 8
	
	pop rcx; me mete lo ultimo de la pila en el registro que le digas

	mov [rax], rcx
	mov rax, -1

	ret
