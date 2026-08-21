# include <stdio.h>
# include <stdlib.h>
# include <math.h>

struct node
{
    int value;
    struct node *next;

};

typedef struct node Node;

typedef struct
{
    Node *front; // Inicio da fila
    Node *rear; //FIm da fila
    int size;
}Queue;

void initialize(Queue *queue)
{
    queue->front = NULL;
    queue->rear = NULL;
    queue->size = 0;
}

int is_empty(Queue *queue)
{
    return queue->size == 0;
}

void enqueue(Queue *queue, int value)
{
    Node *node = malloc(sizeof(Node));

    if(node == NULL)
    {
        printf("ERRO: falha ao alocar memória");
        return;
    }

    node->value = value;
    node->next = NULL;

    if(is_empty(queue))
    {
        queue->front =node;
    }
    else
    {
        queue->rear->next = node;
    }
    queue->rear = node;
    queue->size++;
}

void dequeue(Queue *queue)
{
    if(is_empty(queue))
    {
        printf("ERRO: fila vazia");
        return;
    }

    Node *temporary = queue->front;
    queue->front = temporary->next;
    free(temporary);
    queue->size--;

    if(is_empty(queue))
    {
        queue->rear = NULL;
    }
}

int peek(Queue *queue)
{
    if(is_empty(queue))
    {
        printf("ERRO: fila vazia\n");
        return INFINITY;
    }
    return queue->front->value;
}

void print(Queue *queue)
{
    Node *current = queue->front;

    while(current != NULL)
    {
        printf("%i ", current->value);
        current = current->next;
    }
}

int main ()
{
    Queue queue;
    //Queue *queue = malloc(sizeof(queue));
    initialize(&queue);
    enqueue(&queue,10);
    enqueue(&queue,50);
    enqueue(&queue,880);
    enqueue(&queue,990);
    enqueue(&queue,100);
    dequeue(&queue);
    enqueue(&queue,44);
    print(&queue);
    return EXIT_SUCCESS;
}
