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

  mov ah,04h
  int 1ah
  
  cmp dl, diaEspec
  je validarMes  

     ;ESCREVER UM TEXTO
     mov ax, @data
     mov ds, ax
     mov dx, offset MSGErrada
     mov ah, 09h
     int 21h   
     jmp sairPrograma
    
validarMes:
  cmp dh, mesEspec
  je validarAno
  
     ;ESCREVER UM TEXTO
     mov ax, @data
     mov ds, ax
     mov dx, offset MSGErrada
     mov ah, 09h
     int 21h
     jmp sairPrograma
         
validarAno:
  cmp cl, anoEspec
  je ValidarCorreto

     ;ESCREVER UM TEXTO
     mov ax, @data
     mov ds, ax
     mov dx, offset MSGErrada
     mov ah, 09h
     int 21h
     jmp sairPrograma
        
ValidarCorreto:
     ;ESCREVER UM TEXTO
      mov ax, @data
      mov ds, ax
      mov dx, offset MSGCorreto
      mov ah, 09h
      int 21h

sairPrograma:
 mov ah, 4Ch  ; Funcao de saida
 int 21h      ; Chama a interrupcao para sair  

end main 