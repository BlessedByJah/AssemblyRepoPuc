;BASE
.model small
.stack 100h

;AREA PARA DECLARACAO DE VARIAVEIS
.data
tecla db 0
scanCode db 0
paginaVideo db 0
raqueteLate dw 20
raqueteLin db 20
raqueteCol db 20 
cursorLin db 5
cursorCol db 10
dCol db 1
dLin db 1

;PROGRAMA PRINCIPAL
.code
main:
    mov ax, @data
    mov ds, ax
    
    ;MEU PROGRAMA
LOOPPRINCIPAL:
    
      mov ah,02h
      mov bh,paginaVideo
      mov dh,raqueteLin
      mov dl,raqueteCol
      int 10h
      
      mov al,"o"
      mov bh,paginaVideo
      mov bl,31h
      mov cx,raqueteLate
      mov ah,09h
      int 10h
      
    
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
     mov cx,1
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
    mov scanCode,ah
    
      mov ah,02h
      mov bh,paginaVideo
      mov dh,raqueteLin
      mov dl,raqueteCol
      int 10h
      
      mov al," "
      mov bh,paginaVideo
      mov bl,0h
      mov cx,raqueteLate
      mov ah,09h
      int 10h    
    
    
    
    cmp tecla,","
    jne desvioRaqueteCol001
    
   ;controla o limite da raquete 
    cmp raqueteCol,0
    je  desvioRaqueteCol001; 
    
    
    
    dec raqueteCol
    
   
     
    
desvioRaqueteCol001:
    
    cmp tecla, "."
    jne desvioRaqueteCol002
    cmp raqueteCol,60
    ;limite da direita da raquete
    je desvioRaqueteCol002
    
    inc raqueteCol
    
desvioRaqueteCol002:   
    ;MAQUINA
    mov ax,0
    mov bx,0
    
    mov al,cursorLin
    mov bl,dLin
    add al,bl
    mov cursorLin,al
    
    mov al,cursorCol
    mov bl,dCol
    add al,bl
    mov cursorCol,al
    
    cmp cursorLin,23
    jbe desvio001
    mov dLin,-1
desvio001:    
    cmp cursorLin,1
    jae desvio002
    mov dLin,1    
desvio002:  
    cmp cursorCol,79
    jbe desvio003
    mov dCol,-1
desvio003:    
    cmp cursorCol,1
    jae desvio004
    mov dCol,1    
desvio004:  
    
   
    
    jmp LOOPPRINCIPAL
    
sairPrograma:
 ; Finaliza o programa
 mov ah, 4Ch  ; Funcao de saida
 int 21h   ; Chama a interrupcao para sair
 
 end main