%define SYS_WRITE   0X01
%define SYS_EXIT    0x3c

%define STDIN   0
%define STDOUT  1
%define STDERR  2

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

; ------------------------------------------------------------------------------------
; str_print: ssize_t{rax} str_print(const char *s{rdi})
; ------------------------------------------------------------------------------------
str_print:
    call    str_len
    mov     rdx, rax
    mov     rsi, rdi
    mov     rdi, STDOUT
    mov     rax, SYS_WRITE
    syscall
    ret
