section .data

msg:
    db      `Salve, simpatia!\n`

section .text
global _start
_start:

    mov     rax, msg        ; o que tem em rax?
    mov     rbx, [rax]      ; o que tem em rax?
    lea     rcx, [rax]      ; o que tem em rax?
    lea     rdx, msg        ; o que tem em rax?

teste0:

    mov     rax, 42
    sub     rax, rax

testes1:

    mov     rax, 42
    teste   rax, rax        ; 00101010 & 00101010 = 00101010

testes2:

    mov     rax, 0
    teste   rax, rax        ; 00000000 & 00000000 = 00000000
