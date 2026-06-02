bits 64
default rel

global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc

section .text

; char    *ft_strdup(const char *s);

ft_strdup:
    push rdi                    ; On conserve le pointeur de la string a dupliquer
    
    call ft_strlen wrt ..plt    ; rax = longueur de la string a dupliquer (sans le \0) = n bytes
    inc rax                     ; on incremente la len pour inclure le \0

    mov rdi, rax
    call malloc wrt ..plt       ; rax = addr de la zone memoire allouee
    test rax, rax
    jz .error

    mov rdi, rax
    pop rsi
    call ft_strcpy

    ret

    .error:
        xor rax, rax
        pop rdi
        ret
