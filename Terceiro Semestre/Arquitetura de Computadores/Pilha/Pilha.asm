;BASE
.model small
.stack 100h

;AREA PARA DECLARACAO DE VARIAVEIS
;desenvolver uma funçao para poscicionar o cursor
.data
paginaVideo db 0
cursorLin db 10
cursorCol db 20
MSG db "CHAMPION$"


;PROGRAMA PRINCIPAL
.code

setCursor proc
    
pop cx

    pop ax
    mov dl,al ; DEFINIR A COLUNA DO CURSOR

    pop ax ;LINHA 
    mov dh,al ; DEFINIR LINHA DO CURSOR

    pop ax ;PAGINA DE VIDEO 
    mov bl,al ;DEFINIR A PAGINA DE VIDEO

    mov ah,02h
    int 10h 

    push cx    
ret
setCursor endp


main:
    mov ax, @data
    mov ds, ax
   
    mov ax,0
    mov al,paginaVideo
    push ax ;CARREGAR A PILHA VALOR DA PAGINA DE VIDEO
    
    mov ax,0
    mov al,cursorLin
    push ax ; CARREGAR A PILHA COM O VALOR DA LINHA DO CURSOR
    
    mov ax, 0
    mov al,cursorCol
    push ax ; CARREGAR A PILHA COM O VALOR DA COLUNA DO CURSOR
    
    call setCursor
    
    mov ax, @data
    mov ds, ax
    mov dx, offset MSG
    mov ah, 09h
    int 21h

    
        
sairPrograma:
 ; Finaliza o programa
 mov ah, 4Ch  ; Funcao de saida
 int 21h      ; Chama a interrupcao para sair  

end main   