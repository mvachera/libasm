section .text
global ft_strcpy

ft_strcpy:
	xor rax, rax

.loop:
	mov cl, [rsi + rax]
	mov [rdi + rax], cl
	cmp cl, 0
	je .end
	inc rax
	jmp .loop

.end:
	mov rax, rdi
	ret