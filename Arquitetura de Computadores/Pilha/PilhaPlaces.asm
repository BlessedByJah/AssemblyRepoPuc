;BASE
.model small
.stack 100h

;AREA PARA DECLARACAO DE VARIAVEIS
;desenvolver uma funçao para poscicionar o cursor
;DEFINIR UMA FUNCAO PARA ESCREVER UMA MENSAGEM NO CONSOLE
;LEMBRANDO QUE OS REGISTROS DS e dx : OFFSET, DEVEM SER PASSADOS
;ATRAVés DA PILHA dx : DEVE conter o OFFSET da mensagem 
;e o Ds: deve conter o endereço de .DATA  @DATA  
.data
paginaVideo db 0
cursorLin db 10
cursorCol db 20
MSG db "CHAMPION$"
MSG2 db "Grande Guarani$" 


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

printMSG proc
pop cx
    pop ds ;ENDEREÇO DATA SEGMENT
    pop dx ; 
  
    mov ah, 09h
    int 21h

push cx
ret 
printMSG endp


main:
    mov ax, @data
    mov ds, ax
   
    mov ax,0
    mov al,paginaVideo
    push ax ;CARREGAR A PILHA VALOR DA PAGINA DE VIDEO
    
    mov ax,10
    mov al,cursorLin
    push ax ; CARREGAR A PILHA COM O VALOR DA LINHA DO CURSOR
    
    mov ax, 30
    mov al,cursorCol
    push ax ; CARREGAR A PILHA COM O VALOR DA COLUNA DO CURSO
    call setCursor   
    
    mov ax, offset MSG
    push ax
    push ds
    
    call printMSG
    
sairPrograma:
 ; Finaliza o programa
 mov ah, 4Ch  ; Funcao de saida
 int 21h      ; Chama a interrupcao para sair  

end main   