# include <stdio.h>
# include <stdlib.h>

int **create(int nrows, int ncols)
{
    int **matrix = malloc(nrows * sizeof(int*));

    for (int i = 0; i < nrows; i++)
    {
        matrix[i] = malloc(ncols * sizeof(int));
    }
    return matrix;
}

void delete( int **matrix, int nrows)
{
    for(int i = 0; i < nrows; i++)
    {
        free(matrix[i]);
    }
}

void print (int **matrix, int nrows, int ncols)
{
    for (int i = 0; i < nrows; i++)
    {
        for (int j = 0; j < ncols; i++)
            printf("%3i", matrix[i][j]);
        printf("\n");    

    }
}

void swapline(int **matrix, int source, int target)

{
    int *temporary = matrix[source];
    matrix[source] = matrix[target];
    matrix[target] = temporary;
}

void swapCol(int **matrix, int source, int target)
{
    for(int i = 0; i < nrows; i++)
    {
    int *temporary = matrix[i][source];
    matrix[i][source] = matrix[i][target];
    matrix[i][source] = temporary;
    }
}

int main () 
{

}