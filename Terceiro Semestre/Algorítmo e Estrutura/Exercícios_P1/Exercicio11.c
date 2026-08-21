# include <stdio.h>
# include <stdlib.h>

int soma(int x, int y)
{
    if(y == 0)
    {
        return x;
    }
    return soma(x++,y--);
}
