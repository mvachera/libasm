section .text
global ft_write
extern __errno_location           ; fonction de la libc qu'on va appeler

ft_write:                         ; fd dans rdi, buf dans rsi, count dans rdx
	mov rax, 1                    ; 1 = numéro du syscall write
	syscall                       ; le noyau écrit, résultat dans rax
	cmp rax, 0
	jl .error                     ; rax négatif -> erreur
	ret                           ; succès : rax = nombre d'octets écrits

.error:
	neg rax                       ; rax = -rax (ex : -9 devient 9)
	push rax                      ; met le code d'erreur à l'abri sur la pile
	call __errno_location wrt ..plt   ; rax = adresse de errno
	pop rcx                       ; récupère le code d'erreur dans rcx
	mov [rax], ecx                ; errno = code (int = 4 octets -> ecx)
	mov rax, -1                   ; on renvoie -1
	ret