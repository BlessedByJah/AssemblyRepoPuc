;BASE
.model small
.stack 100h

;AREA PARA DECLARACAO DE VARIAVEIS
;desenvolver a media entres dois valores
.data
divisao dw 0
resto dw 0

;PROGRAMA PRINCIPAL
.code

media proc
    ;cdigo da media
    ;SALVAR O ENDERE?O DE RETORNO
    ;REMOVER VALOR DA PILHA 
    pop cx
    
    
    
    pop ax ; NOTA 2
    pop bx ;NOTA 1
        
    add ax,bx
    mov dx,2
    mov bx,0
    div bx
    ;VALOR DA MEDIA ESTA EM AX
    ;RESTO DA MEDIA ESTA EM DX
    push dx 
    push ax
    push cx
    
ret
media endp


main:
    mov ax, @data
    mov ds, ax
    
    ;meu programa
    
    mov ax, 6
    push ax
    mov ax, 4 
    push ax
    call media
    
    pop ax
    mov resto, ax
    pop ax
    mov divisao,ax
    
    mov ax,2
 
    
sairPrograma:
 ; Finaliza o programa
 mov ah, 4Ch  ; Funcao de saida
 int 21h      ; Chama a interrupcao para sair  

end main   
