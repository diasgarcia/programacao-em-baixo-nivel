global _start

section .data
message: db 'hello, world!', 10

section .text
_start:

    mov     rax, 1          ; o número da chamada de sistema deve ser armazewnado em rax
    mov     rdi, 1          ; argumento #1 em dri: onde escrever (descritor)?
    mov     rsi, message    ; argumento #2 em dsi: onde começa a string?
    mov     rdx, 14         ; argumento #3 em rdx: quantos bytes devem ser escritos?
    syscall

    mov     rax, 60         ; syscall exit
    xor     rdi, rdi        ; código 0
    syscall
