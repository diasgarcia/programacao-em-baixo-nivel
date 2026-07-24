%include "libpbn-io.asm"

section .rodata:
string:     db `Salve, simpatia!\n\0`

section .text
global _start

_start:

    mov     rdi, string
    call    str_len

    mov     rdi, rax
    call    exit
