%include "libpbn-io.asm"

section .bss
uint64_str:
    resb    UNIT64_BUFSIZ

section .text
global _start

_start:

    mov     rdi, 42
    call    chr_print
    call    nl_print

    mov     rdi, EXIT_SUCCESS
    call    exit
