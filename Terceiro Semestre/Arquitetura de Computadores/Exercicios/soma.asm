;BASE
.model small
.stack 100h
;Murilo Augusto De Mattos Marciano

;AREA PARA DECLARACAO DE VARIAVEIS
.data
    
    V1      dw 4        ; V1 = 4
    V2      dw 5        ; V2 = 5
    V3      dw 3        ; V3 = 3
    Result1 dw 0
    Result2 dw 0
    Result3 dw 0
    Result4 dw 0
    Result5 dw 0

;PROGRAMA PRINCIPAL
.code
main:
    mov ax, @data
    mov ds, ax

    ;ADD
    mov ax, 10
    add ax, V1
    mov Result1, ax
    
    ;ADD
    mov ax, 12
    add ax, V1
    mov Result2, ax
    
    ;ADD
    mov ax, 02ah
    add ax, V1
    mov Result3, ax
    
    ;ADD
    mov ax, V1
    add ax, V2
    mov Result4, ax
    
    ;ADD
    mov ax, V1
    add ax, V2
    sub ax, V3
    mov Result5, ax

sairPrograma:
    ; Finaliza o programa
    mov ah, 4Ch         ; Funcao de saida
    int 21h             ; Chama a interrupcao para sair

end main
