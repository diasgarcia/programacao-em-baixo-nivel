global _start

section .data
message: db `Salve, simpatia!\n`, 10

section .text
_start:

    mov     rax, 1          ; o número da chamada de sistema deve ser armazewnado em rax
    mov     rdi, 1          ; argumento #1 em dri: onde escrever (descritor)?
    mov     rsi, message    ; argumento #2 em dsi: onde começa a string?
    mov     rdx, 17         ; argumento #3 em rdx: quantos bytes devem ser escritos?
    syscall

_quit:

    mov     rax, 0x3c       ; 60
    ; mov     rdi, 42
    xor     rdx, rdx
    syscall
