section .text
global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc

ft_strdup:                      ; s est dans rdi
	push rdi                    ; sauvegarde s sur la pile
	call ft_strlen              ; rax = longueur de s (rdi contient encore s)
	inc rax                     ; +1 pour le '\0'
	mov rdi, rax                ; argument de malloc : la taille
	call malloc wrt ..plt       ; rax = nouvelle zone mémoire (ou NULL)
	cmp rax, 0
	je .end                     ; malloc a échoué -> on renvoie NULL
	mov rdi, rax                ; dst = la nouvelle zone
	mov rsi, [rsp]              ; src = s, relu depuis le sommet de la pile
	call ft_strcpy              ; copie s dans la zone, rax = dst

.end:
	pop rcx                     ; retire s de la pile (rcx sert juste de poubelle)
	ret                         ; rax = la copie (ou NULL)