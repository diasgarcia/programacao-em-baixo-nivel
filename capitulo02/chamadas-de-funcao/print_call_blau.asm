section .data
newline_char:   db 10
codes:          db '0123456789ABCDEF'

section .text
global _start

_start:
    mov     rdi, 0x1122334455667788

    call    print_hex
    call    print_newline

    mov     rax, 60
    xor     rdi, rdi
    syscall

; ---------------------------------------------------------------------
; ROTINAS
; ---------------------------------------------------------------------
print_newline:
; ---------------------------------------------------------------------
; Descrição : imprime um caractere de nova linha ('\n' = 0x0a)
; Parâmetros: void
; Retorna   : void
; Nota      : requer caractere '\n' no rótulo 'newline_char'
; ---------------------------------------------------------------------
    mov     rax, 1              ; identificador da syscall 'write'
    mov     rdi, 1              ; descritor de arquivo stdout
    mov     rsi, newline_char   ; local onde os dados são obtidos
    mov     rdx, 1              ; a quantidade de bytes a ser escrita
    syscall
    ret

; ---------------------------------------------------------------------

print_hex:
; ---------------------------------------------------------------------
; Descrição : imprime os dígitos hexadecimais do valor em rdi
; Parâmetros: rdi <- valor a ser impresso
; Retorna   : void
; Nota      : requer a lista de dígitos hexa no rótulo 'codes'
; ---------------------------------------------------------------------
    mov     rax, rdi            ; copia o valor a ser impresso em rax

    mov     rdi, 1              ; define o descritor de arquivos 1 (stdout)
    mov     rdx, 1              ; quantidade de bytes a serem impressos

    mov     rcx, 64             ; até que ponto estamos deslocando rax?

.iterate:
    push    rax                 ; salva o valor inicial de rax
    sub     rcx, 4
    sar     rax, cl             ; desloca para 60, 56, 52, ... 4, 0
                                ; o registrador cl é a menor parte de rcx

    and     rax, 0xf            ; limpa todos os bits, menos os 4 menos significativos
    lea     rsi, [codes + rax]  ; obtém o código de caractere de um dígito hexa

    mov     rax, 1              ; syscall 'write'

    push    rcx                 ; syscall alterará rcx
    syscall                     ; rax = 1 chamada 'write'
                                ; rdi = 1 para stdout
                                ; rsi = o endereço de um caractere; veja a linha 29

    pop     rcx                 ; restaura rcx

    pop     rax                 ; restaura rax
    test    rcx, rcx            ; rcx = 0 -> todos os dígitos foram impressos
    jnz     .iterate

    ret

; ---------------------------------------------------------------------
