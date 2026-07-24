%define SYS_EXIT 0x3c
%define NUL 0

; ------------------------------------------------------------------------------------
; exit: [[noreturn]] void exit(int status{rdi});
; ------------------------------------------------------------------------------------
exit:
    mov     rax, SYS_EXIT
    syscall

; ------------------------------------------------------------------------------------
; str_len: size_t{rax} strlen(const char *s{rdi});
; ------------------------------------------------------------------------------------
str_len:
    xor     rax, rax    ; zera todos os bits de rax

.loop:
    cmp     byte [rdi+rax], NUL
    je      .end
    inc     rax
    jmp     .loop

.end:
    ret
