; rsi <- endereco do rotulo 'codes'
mov rsi, codes

; rsi <-  conteudo da memoria, comecando no endereco 'codes'
; 8 bytes consecutivos sao obtidos porque o tamanho de rsi é de 8 bytes
mov rsi, [codes]

; rsi <- endereco de 'codes'
; neste caso, é equivalente a mov rsi, codes
; em geral, o endereco pode conter varios componentes
lea rsi, [codes]

; rsi <- codes + rax
; equivalente a combinacao:
; -- mov rsi, codes
; -- add rsi, rax
; nao é possivel fazer isto com um unico mov!
lea rsi, [codes + rax]
