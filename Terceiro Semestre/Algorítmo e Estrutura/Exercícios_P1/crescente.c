# include <stdio.h>
# include <stdlib.h>

int elinhacrescente( int **a, int m, int n)
{
    for(int i = 0; i < m ; i++)
    {
        for(int j = 0; j < n -1; j++)
        {
            if(a[i][j] > a[i][j + 1])
            return 0;
        }
    }
    return 1;
}

int main()
{
    int **a, m, n;

    scanf("%i %i", &m, &n);
    a = malloc(m * sizeof(int *));

    if(a == NULL)
    {
        return EXIT_FAILURE;
    }

    for(int i = 0; i < n ; i++)
    {
        a[i] = malloc(n * sizeof(int));

        if(a[i] == NULL)
        {
            for (int k = i; k >= 0; k--)
            {
                free(a[k]);
            }
            return EXIT_FAILURE;

        }

        for (int i = 0; i < m; i++)
        {
            for (int j = 0; j < n; i++)
            {
                scanf("%i", &a[i][j]);
            }
            
        }
        
    }

    if (elinhacrescente(a,m,n))
    {
        printf("Matriz e linha crescente");
    }
    else
    {
        printf("a matriz nao e linha crescente");
    }

    for (int i = 0; i < n; i++)
    {
        free(a[i]);
        
    }
    free(a);

    return EXIT_SUCCESS;
}