;BASE
.model small
.stack 100h

;AREA PARA DECLARACAO DE VARIAVEIS
.data
dcol db  1
dlin db 1
cursorLin db 2
cursorCol db 2
paginaVideo db 0
caracterRepeticao dw 1
tecla db 0
scanCode db 0

;PROGRAMA PRINCIPAL
.code
main:
    mov ax, @data
    mov ds, ax
    
      mov cursorLin,10
      mov cursorCol,5
    ;MEU PROGRAMA
    
LOOPPRINCIPAL:
    ;SETAR POSICAO DO CURSOR

      mov bh,paginaVideo
      mov dh,cursorLin
      mov dl,cursorCol
      mov ah,02h   ;CODIGO FUNCAO
      int 10h
        
      ;ESCREVER CARACTER  
     ; NA POSICAO DO CURSOR
     ;AL = CARACTER
     ;BH = NUMERO DA PAGINA
     ;CX = NUMERO DE REPETICAO
     ;RETORNO
     ; NAO SE APLICA
     mov al,"*"
     mov bh,paginaVideo
     mov cx,caracterRepeticao
     mov ah,0Ah   ;CODIGO FUNCAO
     int 10h
     
     ;LER UMA TECLA - TECLADO ? BIOS
    ;SE TECLADO N?O COMPATIVEL COM
    ; IBMPC, EFETUA A LEITURA DE 
    ; TODA A SEQUENCIA DE VALORES
    ; GERADOS
    ;ah = 10h ; LER TECLA
    ;           ESPERA TECLA SER 
    ;            DIGITADA
    ; RETORNO
    ; Al : CARACTER LIDO
    ; AH : Scan Code
    mov ah,10h 
    int 16h
    mov tecla,al
    
    ;MAQUINA DE MOVIMENTO
    
    mov al,cursorCol
    mov bl,dcol
    add al,bl
    mov cursorCol,al
    
    mov al,cursorLin
    mov bl,dlin
    add al,bl
    mov cursorLin,al
    
    ;LIMITADOR
    
    ;Chao
    cmp cursorLin,23
    jbe Desvio1
    mov dlin,-1
Desvio1:
      
    ;Teto
    cmp cursorLin,1
    jae Desvio2
    mov dlin,1
Desvio2:
    ;Direita
    cmp cursorCol,79
    jbe Desvio3
    mov dcol,-1
    
Desvio3:
    ;Esquerda
    cmp cursorLin,1
    jae Desvio4
    mov dlin,1
Desvio4:
    jmp LOOPPRINCIPAL
       
jmp LOOPPRINCIPAL
    
sairPrograma:
 ; Finaliza o programa
 mov ah, 4Ch  ; Funcao de saida
 int 21h      ; Chama a interrupcao para sair  

end main   
