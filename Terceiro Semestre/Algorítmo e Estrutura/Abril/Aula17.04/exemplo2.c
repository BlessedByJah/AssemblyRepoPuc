# include <stdlib.h>
# include <stdlib.h>

struct record
{
    int value;
    struct record *next;
};

typedef struct record Node;



Node *insert(Node *head, int value, int position)
{
    Node *new = malloc(sizeof(Node));
    
    if (new == NULL)
    {
        return NULL;
    }

    new->value = value;
    new->next = NULL;

    //Caso Um 
    if (position == 0)
    {
        new->next = head;
        head = new;
        
        return head;
    }

    //Caso2 - Qualquer posição da lista 
    Node * current = head;

    int i = 1;
    while(position - 1 && current->next != NULL)
    {
        current = current->next;
        i = i +1;

    }
    new->next = current->next;
    current->next = new->next;

    return head;
    
}

/*
 for (int i = 1; i < position - 1 && current->next != NULL; i++)
    {
        current = current->next;
    }
*/