# include <stdio.h>
# include <stdlib.h>

//exercicio 10
int multiplicacao(int x, int y)
{
    if(y == 1)
    {
        return x;
    }
    return x + multiplicacao(x, y--);
}