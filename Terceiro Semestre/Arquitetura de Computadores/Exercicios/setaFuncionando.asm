;BASE
.model small
.stack 100h

;AREA PARA DECLARACAO DE VARIAVEIS
.data
contador db 0
Cor db 0
paginaVideo db 0
cursorLin db 12
cursorCol db 10
caracterRepeticao dw 1
caracterCor db 28h

;PROGRAMA PRINCIPAL
.code
main:
    mov ax, @data
    mov ds, ax
    
    ;MEU PROGRAMA
Inicio:
      mov cursorLin,10
      mov cursorCol,5
      mov contador,0
      
loop:
      ;Delay
      mov cx, 0ffffh
      loopdelay:
            nop
      loop loopdelay
      
      inc contador

;SETAR POSICAO DO CURSOR    
      mov bh,paginaVideo
      mov dh,cursorLin
      mov dl,cursorCol
      mov ah,02h   ;CODIGO FUNCAO
      int 10h

;ESCREVER CARACTER e ATRIBUTO
      mov al,">"
      mov bh,paginaVideo
      mov bl,Cor
      mov cx,caracterRepeticao
      mov ah,09h ;CODIGO FUNCAO
      int 10h
      
      inc Cor
      inc cursorCol
      
 ;Condi??o de parada
      mov al,contador
      mov bl,20
      cmp al,bl
      jbe loop
      
      ;Invers?o##########
      
      mov cursorLin,10
      mov cursorCol,20
      mov contador,20
      
loopInverso:
      ;Delay
      mov cx, 0ffffh
  loopdelay2:
            nop
            loop loopdelay2
      
      dec contador

;SETAR POSICAO DO CURSOR    
      mov bh,paginaVideo
      mov dh,cursorLin
      mov dl,cursorCol
      mov ah,02h   ;CODIGO FUNCAO
      int 10h

;ESCREVER CARACTER e ATRIBUTO
      mov al,"<"
      mov bh,paginaVideo
      mov bl,Cor
      mov cx,caracterRepeticao
      mov ah,09h ;CODIGO FUNCAO
      int 10h
      
      inc Cor
      dec cursorCol
      
 ;Condi??o de parada
      mov al,contador
      mov bl,5
      cmp al,bl
      jae loopInverso
      
      jmp Inicio
      
      
     
    
sairPrograma:
 ; Finaliza o programa
 mov ah, 4Ch  ; Funcao de saida
 int 21h      ; Chama a interrupcao para sair  

end main   
