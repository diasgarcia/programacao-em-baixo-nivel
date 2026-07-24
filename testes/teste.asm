%include "libpbn-io.asm"

section .text
global _start

_start:

    mov     rdi, 0x2a   ; 42
    call    exit
