# include <stdio.h>
# include <stdlib.h>

# define TRUE 1
# define FALSE 0

int search(int *v, int n, int k)
{
    for (int i = 0; i < n ; i++)
        if (v[i] == k)
        {
            return i;       
        }
    return -1;
}

int twosum (int *v, int n, int k)
{
 for ( int i = 0; i < n; i++)
    {    
            int j = search(v, n,  k - v[i]);

            if(j != -1 && i != j)
                return TRUE; 
    }
    return FALSE;   
}

int main (int argc, char argv[])
{
    int n = atoi(argv[1]), k;

    if(argc != n + 3)
    {
        printf("ERRO: o numero de parametros esta incorreto!\n");
        return EXIT_FAILURE;
    }
    
    int *v = malloc(n * sizeof(int));

    if(v == NULL)
    {
        printf("ERRO: falha na memoria");
        return EXIT_FAILURE;
    }

    for (int i = 0; i < n; i++)
    {
        v[i] = atoi(argv[i + 2]);
    }

    k = atoi(argv[n + 2]);

    if(twosum (v, n ,k) )
    {
        print("SIm, existem dois elementos que somados seja iguala %i.", k);
    }
    else{
        print("Nao, existem dois elemntos que somados sao iguais a %i", k);
    }

    free(v);

    return EXIT_SUCCESS;  
}