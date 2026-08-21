;BASE
.model small
.stack 100h

;AREA PARA DECLARACAO DE VARIAVEIS
.data
tecla db 0
scanCode db 0
paginaVideo db 0
cursorLin db 12
cursorCol db 40
CaracterRepeticao dw 1

;PROGRAMA PRINCIPAL
.code
main:
    mov ax, @data
    mov ds, ax
    
    ;MEU PROGRAMA
LOOPINICIAL:
    
      ;SETAR POSICAO DO CURSOR
      mov bh,paginaVideo
      mov dh,cursorLin
      mov dl,cursorCol
      mov ah,02h   ;CODIGO FUNCAO
      int 10h
      
     mov al,tecla
     mov bh, 0
     mov cx,CaracterRepeticao
     mov ah,0Ah   ;CODIGO FUNCAO
     int 10h 
      
    ;Scan de Tecla
    mov ah,10h 
    int 16h
    mov tecla,al
    mov scanCode,ah
    
Cima:    
    mov al,tecla
    cmp al,"l"
    jnz baixo
    dec cursorLin
     mov tecla, "|"
    jmp LOOPINICIAL
baixo:
    cmp al,"m"
    jnz direita
    inc cursorLin
    mov tecla, "|"
    jmp LOOPINICIAL
direita:
    cmp al,"k"
    jnz esquerda
    inc cursorCol
     mov tecla, "_"
    jmp LOOPINICIAL
esquerda:
    cmp al,"j"
    jnz fimMonitorarTecla
    dec cursorCol
     mov tecla, "_"
    jmp LOOPINICIAL
    
    
    
fimMonitorarTecla:
jmp LOOPINICIAL

    
sairPrograma:
 ; Finaliza o programa
 mov ah, 4Ch  ; Funcao de saida
 int 21h      ; Chama a interrupcao para sair  

end main   