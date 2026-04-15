;BASE
.model small
.stack 100h

;AREA PARA DECLARACAO DE VARIAVEIS
.data
soma dw 0
tecla dw 0
g dw 0
contador dw 0
paginaVideo db 0
cursorLin db 2
cursorCol db 2
MSGOK db "CODIGO VALIDO$"
MSGNOK db "CODIGO INVALIDO$"

;PROGRAMA PRINCIPAL
.code
main:
  mov ax, @data
  mov ds, ax
  
  ;MEU PROGRAMA
  ;LER OS VALORES DO TELCADO
loopLerTecla:
  ;LER UM CARACTER COM ECHO
    ;CARACTER LIDO EM al
    mov ah, 01h
    int 21h 
    sub ax,30h
    mov tecla,ax
    mov ax,soma
    add ax,tecla
    mov soma,ax
    
    inc contador
    cmp contador,6
    jne loopLerTecla
    
  ;LER UM CARACTER COM ECHO
  ;CARACTER LIDO EM al
    mov ah, 01h
    int 21h
    mov ah,0 
    sub ax,30h
    mov g,ax
    
    ;CALCULAR RESTO
    mov dx,0
    mov ax, soma
    mov bx,10
    div bx
    
    cmp dx,g
    je valido
  
  ;CALCULAR O RESTO DA DIVISAO
  mov dx,0
  mov bx,10
  div bx
  
  cmp dx,g
  je valido
  
     ;SETAR POSICAO DO CURSOR
      mov cursorLin,10
      mov cursorCol,5
      mov bh,paginaVideo
      mov dh,cursorLin
      mov dl,cursorCol
      mov ah,02h   ;CODIGO FUNCAO
      int 10h
      
      ;ESCREVER TEXTO - MENSAGEM
      mov ax, @data
      mov ds, ax
      mov dx, offset MSGNOK
      mov ah, 09h
      int 21h

      jmp sairPrograma
      
valido:
      ;SETAR POSICAO DO CURSOR
      mov cursorLin,10
      mov cursorCol,5
      mov bh,paginaVideo
      mov dh,cursorLin
      mov dl,cursorCol
      mov ah,02h   ;CODIGO FUNCAO
      int 10h
      
      ;ESCREVER TEXTO - MENSAGEM
      mov ax, @data
      mov ds, ax
      mov dx, offset MSGOK
      mov ah, 09h
      int 21h


sairPrograma:
 mov ah, 4Ch  ; Funcao de saida
 int 21h      ; Chama a interrupcao para sair  

end main 
