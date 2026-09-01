/******************************************************************************

Welcome to GDB Online.
  GDB online is an online compiler and debugger tool for C, C++, Python, PHP, Ruby, 
  C#, OCaml, VB, Perl, Swift, Prolog, Javascript, Pascal, COBOL, HTML, CSS, JS
  Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>

int main()
{
    float notas[50] = {9.0,7.8,10.0,8.9,2.5}  ; 
    int contnotas = 5;
    FILE *arq;
  
  char buffer[100];
  
  arq=fopen("notasescrita001.txt", "wr");
  
  for(int pos=0;pos < contnotas -1 ;pos++)
  {
      fprintf(arq , "%7.2f\n",notas[pos]);
      
  }
  fclose(arq);
  printf("In future we trust");
}
