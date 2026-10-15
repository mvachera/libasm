section .text
global ft_strcmp

ft_strcmp:
	xor rax, rax

.loop:
	movzx ecx, byte [rsi + rax]
	movzx edx, byte [rdi + rax]
	cmp edx, ecx
	jne .end
	cmp edx, 0
	je .end
	inc rax
	jmp .loop

.end:
	sub edx, ecx
	mov eax, edx
	ret