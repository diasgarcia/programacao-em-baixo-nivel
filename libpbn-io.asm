%define SYS_WRITE   0X01
%define SYS_EXIT    0x3c

%define FD_STDIN   0
%define FD_STDOUT  1
%define FD_STDERR  2

%define NUL 0
%define EOL 0x0a

%define EXIT_SUCCESS 0
%define EXIT_FAILURE 1

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
    mov     rdi, FD_STDOUT
    mov     rax, SYS_WRITE
    syscall
    ret

; ------------------------------------------------------------------------------------
; chr_print: int{rax} chr_print(int c{rdi});
; ------------------------------------------------------------------------------------
chr_print:
    push    rdi
    mov     rsi, rsp
    mov     rdx, 1
    mov     rax, SYS_WRITE
    mov     rdi, FD_STDOUT
    syscall
    add     rsp, 8
    ret

; ------------------------------------------------------------------------------------
; nl_print: int{rax} nl_print(void)
; ------------------------------------------------------------------------------------
nl_print:
    mov     rdi, EOL
    call    chr_print
    ret

; ------------------------------------------------------------------------------------
; uint64_to_str: size_t{rax} uint64_to_str(char *buf{rdi}, size_t num{rsi})
; ------------------------------------------------------------------------------------
%define UNIT64_BUFSIZ 21

uint64_to_str:
