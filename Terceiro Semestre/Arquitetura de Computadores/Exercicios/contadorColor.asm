;BASE
.model small
.stack 100h

;AREA PARA DECLARACAO DE VARIAVEIS
.data
paginaVideo db 0
cursorLin db 5
cursorCol db 10
MSG db "didn't you realize? that you are a Champion, in their eyes$" ;10caracteres
MSG2 db "              $" ;15caracteres
cont dw 0
caracterRepeticao dw 1
letra db 0
Cor db 0


;PROGRAMA PRINCIPAL
.code
main:
    mov ax, @data
    mov ds, ax
    
    mov cursorLin,10
    mov cursorCol,5
    
loop:
     mov cx, 0ffffh
      loopdelay:
            nop
      loop loopdelay
    
     mov ax,cont
     mov di, offset MSG
     add di,ax 
     mov al,ds:[di]
     mov letra,al
     
     cmp al,"$"
     je sairLoop 
     
     ;SETAR POSICAO DO CURSOR
      
      mov bh,paginaVideo
      mov dh,cursorLin
      mov dl,cursorCol
      mov ah,02h   ;CODIGO FUNCAO
      int 10h

   ; NAO SE APLICA
     mov al,letra
     mov bh,paginaVideo
     mov bl,Cor
     mov cx,caracterRepeticao
     mov ah,09h   ;CODIGO FUNCAO
     int 10h
     
     inc Cor
     inc cont
     inc cursorCol
     mov bl,10
    
     jmp loop
    
sairLoop:    
     mov cursorLin,10
     mov cursorCol,5
     mov bh,paginaVideo
     mov dh,cursorLin
     mov dl,cursorCol
     mov ah,02h   ;CODIGO FUNCAO
     int 10h
     
     sairPrograma:
 ; Finaliza o programa
 mov ah, 4Ch  ; Funcao de saida
 int 21h   ; Chama a interrupcao para sair
 
 end main
