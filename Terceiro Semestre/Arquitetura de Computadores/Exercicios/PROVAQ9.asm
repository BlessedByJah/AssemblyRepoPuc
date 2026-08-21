;BASE
.model small
.stack 100h
.data
;aRMAZENAR O OFFSET DA MENSAGEM 1
contPosMSG1 dw 0
;aRMAZENAR O OFFSET DA MENSAGEM 1
contPosMSG2 dw 0
MSG1 db "Kendrick$"
MSG2 db "Kendrick$"
MSGIGUAL db "MENSAGENS IGUAIS$"
MSGDIFERENTES db "MENSAGENS DIFERENTES$"


;PROGRAMA PRINCIPAL
.code

main:
    mov ax, @data
    mov ds, ax
    
    ;MEU PROGRAMA
    ;CARREGAR O OFFSET DA MENSAGEM 1
    mov ax,offset MSG1
    mov contPosMSG1,ax
    ;CARREGA O OFFSET DA MENSAGEM 2
    mov ax,offset MSG2
    mov contPosMSG2,ax
    
loop:
    ;CARREGAR O CARACTER DE MSG1
    mov di, contPosMSG1
    mov al,ds:[di]
    ;CARREGAR O CARACTER DE MSG2
    mov di, contPosMSG2
    mov bl,ds:[di]
    
    ;VERIFICAR SIM DA MENSAGEM 1
    cmp al,"$"
    jne compararCaracter
    ;VERIFICAR FIM DA MENAGEM 2
    cmp bl,"$"
    jne compararCaracter
    
    ;IMPRMIR MENSAGEM IGUAL
    ;ESCREVER TEXTO - MENSAGEM
    mov ax, @data
    mov ds, ax
    mov dx, offset MSGIGUAL
    mov ah, 09h
    int 21h

    jmp sairPrograma
    
compararCaracter:
    ;COMPARAR CARACTERES DE MSG1 DE MSG2
    cmp al,bl
    jne loopDiferente
    
    inc contPosMSG1
    inc contPosMSG2
    
    jmp loop
    
loopDiferente:
    ;IMPRIMIR A MENSAGEM DIFERENTE
    mov ax, @data
    mov ds, ax
    mov dx, offset MSGDIFERENTES
    mov ah, 09h
    int 21h

    
    
sairPrograma:
 ; Finaliza o programa
 mov ah, 4Ch  ; Funcao de saida
 int 21h      ; Chama a interrupcao para sair  

end main   
