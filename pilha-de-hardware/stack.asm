section .text
global _start
_start:

        mov     rax, 0x2a
        mov     ebx, 0xb8
        mov     cx, 0x42

        push    rax         ; armazena 8 bytes (alinhamento padrão)
        ; push    ebx         ; argumento r32 é invalidade em x86-64
        push    0x01020304  ; 4 bytes, mas armazena 8
        ; push    0x0102030405060708  ;argumento imm64 é invalido em x86-64
        push    cx          ; armazena 2 bytes, mas desalinha a pilha

; push cx           -> 0x7fffffffdfce: 0x42 0x00 (desalinhamento)
; push 0x01020304   -> 0x7fffffffdƒd0: 0x04 0x03 0x02 0x01 0x00 0x00 0x00 0x00
; push rax          -> 0x7ffffffffƒd8: 0x2a 0x00 0x00 0x00 0x00 0x00 0x00 0x00

        pop     ax
        ; pop     ebx         ; argumento r32 é invalido em x86-64
        pop     rbx
        pop     rcx

        mov     rax, 0x3c
        xor     rdi, rdi
        syscall
