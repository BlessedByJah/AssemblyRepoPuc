;BASE
.model small
.stack 100h

;AREA PARA DECLARACAO DE VARIAVEIS
.data
MSGCorreto db "Data Valida$"
MSGErrada db "Data Invalida$"
diaEspec db 31h
mesEspec db 03h
anoEspec db 26h

;PROGRAMA PRINCIPAL
.code
main:
  mov ax, @data
  mov ds, ax
  
  ;MEU PROGRAMA
  ;SETAR POSICAO DO CURSOR
  mov ah,02h   ;CODIGO FUNCAO
  int 10h
  
  mov ah,04h
  int 1ah
  
  cmp dl, diaEspec
  jne  ValidarErro
  
  cmp dh, mesEspec
  jne  ValidarErro
  
  cmp cl, anoEspec
  jne  ValidarErro
    
ValidarCorreto:
     ;ESCREVER UM TEXTO
      mov ax, @data
      mov ds, ax
      mov dx, offset MSGCorreto
      mov ah, 09h
      int 21h
       jmp sairPrograma
 ValidarErro:
     ;ESCREVER UM TEXTO
      mov ax, @data
      mov ds, ax
      mov dx, offset MSGErrada
      mov ah, 09h
      int 21h
      
sairPrograma:
 mov ah, 4Ch  ; Funcao de saida
 int 21h      ; Chama a interrupcao para sair  

end main 