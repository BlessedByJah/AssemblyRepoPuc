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
  FILE *arq;
  
  char buffer[100];
  float soma, media;
  int contnotas;
  
  
  arq=fopen("notasleitura001.txt", "rt");
   contnotas = 0;
   soma = 0;
  while(!feof(arq))
  {
      fgets(buffer,100,arq);
      printf("\n%s",buffer);
      
      soma = soma+atof(buffer);
      contnotas++ ;
  }
  media = soma/contnotas;
  fclose(arq);
  printf("In future we trust %7.2f", media );
}
