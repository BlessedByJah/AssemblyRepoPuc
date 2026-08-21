# include <stdio.h>
# include <stdlib.h>

struct node
{
    int value;
    struct node *next;
};

typedef struct node Node;

typedef struct 
{
    Node *top;
    int size;
}Stack;

void initialize(Stack *stack)
{
    stack->top = NULL;
    stack->size = 0;
}

int is_empty(Stack *stack)
{
    return stack->size == 0;
}

void push(Stack *stack, int value)
{   
}
void pop(Stack *stack)
{

}
int peek(Stack *stack)
{
    
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