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
  
  char buffer[1000];
  char nome [1000];
  float peso, altura, IMC;
  float somaAltura = 0, somaPeso = 0, mediaAltura = 0, mediaPeso = 0;
  int tam;
  int cont = 0;
  arq=fopen("Alunos.txt", "rt");
  
  
  while(!feof(arq))
  {
      fgets(buffer,100,arq);
      tam = strlen(buffer);
      buffer[tam-1] ='\0';
      strcpy(nome,buffer);

      fgets(buffer,100,arq);
      altura = atof(buffer);

      fgets(buffer,100,arq);
      peso = atof(buffer);
      
      IMC = peso / (altura * altura);
      
      somaAltura = somaAltura + altura;
      somaPeso = somaPeso + peso;
      cont++;
      
      printf("\nNome: %-20s Peso: %7.2f Idade: %7.2f de IMC: %7.2f", nome, peso, altura, IMC);
  }
  // altura e peso
    mediaAltura = (somaAltura / cont);
    mediaPeso = (somaPeso / cont);
    fclose(arq);
    printf("\n\n== In future we trust ==\n");
    printf("Pessoas cadastradas: %5d \n", cont);
    printf("Media das altura é: %7.2f \n", mediaAltura);
    printf("Media dos pesos é: %7.2f", mediaPeso);
  
}