# include  <stdio.h>
# include <stdlib.h>

struct node 
{
    int value;
    struct node *left;
    struct node *right;
};

typedef struct node Node;

Node *create(int value, Node *left, Node *right)
{
    Node *node = malloc(sizeof(node));

    if(node == NULL)
    {
        printf("ERRO: Memoria vazia");
        return NULL;
    }

    node->value = value;
    node->left = left;
    node->right = right;
    return node;
}

void preOrder(Node *root)
{
    if(root != NULL)
    {
        printf("%i ", root->value);
        preOrder(root->left);
        preOrder(root->right);
    }

}
void inOrder(Node *root)
{
    if ( root != NULL)
    {
        inOrder(root->left);
        printf("%i ", root->value);
        inOrder(root->right);
    }

}
void posOrder(Node *root)
{
    if(root != NULL)
    {
        posOrder(root->left);
        posOrder(root->right);
        printf("%i ", root->value);
    }
}

int height(Node *root)
{
    if (root == NULL)
    {
        return 0;
    }

    int leftHeight = height(root->left);
    int RightHeight = height(root->right);

    if(leftHeight > RightHeight)
    {
        return 1 + leftHeight;
    }
    else
    {
        return 1 + RightHeight;
    }
}

int main()
{
    Node *root               = create(2, NULL,NULL);
    root->left               = create(5, NULL,NULL);
    root->left->left         = create(3, NULL,NULL);
    root->left->right        = create(8, NULL,NULL);
    root->left->right->left  = create(4, NULL,NULL);
    root->right              = create(7, NULL,NULL);
    root->right->left        = create(1, NULL,NULL);
    root->right->left->right = create(9, NULL,NULL);
    root->right->right       = create(6, NULL,NULL);
    preOrder(root);
    printf("\n");
    inOrder(root);
    return EXIT_SUCCESS;
}