# include <stdio.h>
# include <stdlib.h>

# define CAPACITY 100

typedef struct
{
    int values[CAPACITY];
    int top;
} Stack;

void initialize(Stack *stack)
{
    stack->top = -1;
}

int is_empty(Stack *stack)
{
    return stack->top == -1;
}
int is_full(Stack *stack)
{
    return stack->top == CAPACITY - 1;
}

void push(Stack *stack, int value)
{
    if(is_full(stack))
    {
        printf("ERRO: a pilha esta cheia.\n");
        return;
    }
    stack->values[++stack->top] = value;
}

void pop(Stack *stack)
{
    if (is_empty(stack))
    {
        printf("ERRO: a pilha está vazia");
        return;
    }
    stack->top--;
}

int peek(Stack *stack)
{
    if (is_empty(stack))
    {
        printf("ERRO: a pilha está vazia");
        return -1;
    }
    return stack->values[stack->top];
}

void print(Stack *stack)
{
    for (int i = stack->top; i >= 0 ; i--)
    {
        printf("[%i] %i\n", i, stack->values[i]);
    }
}

int main()
{
    Stack stack;
    initialize(&stack);
    push(&stack, 10);
    push(&stack, 20);
    push(&stack, 88);
    pop(&stack);
    push(&stack, 13);
    push(&stack, 10);
    printf("o valor do tpo e %i\n", peek(&stack));
    print(&stack);
}