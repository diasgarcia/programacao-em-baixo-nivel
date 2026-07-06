.global _start
.intel_syntax noprefix

_start:
    call    print_hello_world
    jmp     exit

print_hello_world:
    mov     rax, 0x01
    mov     rdi, 0x01
    lea     rsi, [hello_str]
    mov     rdx, 14
    syscall
    ret

exit:
    mov     rax, 0x3c
    mov     rdi, 0
    syscall

.section .data
    hello_str: .asciz "hello, world!\n"
