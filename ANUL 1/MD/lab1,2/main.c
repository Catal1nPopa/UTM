#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>

typedef struct Telefoane
{
    char denumire[15];
    char pret[10];
} Telefoane;

Telefoane * create_array(int n)
{
    Telefoane * x = calloc(sizeof(Telefoane),n);
    return x;
}

void citire_array(Telefoane * x, int num)
{
    for(int i = 0; i < num; i++)
    {
        printf("Introduceti datele telefonului -[%d]-:\n", i);
        printf("Denumirea: ");
        scanf("%s",&x[i].denumire);
        printf("Pretul: ");
        scanf("%s",&x[i].pret);
    }
}

void print_array(Telefoane * x, int num)
{
    for(int i = 0; i < num; i++)
    {
        printf("Telefonul: %d\n",i);
        printf("Denumirea: %s\n", x[i].denumire);
        printf("Pretul: %s\n", x[i].pret);
    }
}

void search_by_key(Telefoane * x, int n)
{
    int key;
    char cauta[10];
    printf("Cauta dupa: 1)Denumire \n 2)Pret\n");
    scanf("%d",&key);

    if(key == 1)
    {
        printf("Dati denumirea:");
        scanf("%s",&cauta);
        for(int j=0; j<n; j++)
        {
            if(strcmp(x[j].denumire,cauta) == 0)
            {
                printf("Elementul cautat se afla pe pozitia: %d\n",j);
                break;
            }
        }
    }
    else if(key == 2)
    {
        printf("Dati pretul:");
        scanf("%s",&cauta);
        for(int j=0; j<n; j++)
        {
            if(strcmp(x[j].pret,cauta) == 0)
            {
                printf("Elementul cautat se afla pe pozitia: %d\n",j);
                break;
            }
        }
    }
}

int menu()
{
    int error_input_found = 0;
menu_start:
    system("cls");
    printf("---------Menu---------\n");
    printf("1) Creaza tablou\n");
    printf("2) Initializeaza tablou\n");
    printf("3) Afiseaza tablou\n");
    printf("4) Cauta in tablou un element\n");
    printf("0) Opriti programul");
    int command = 100;
    printf("\n\nSelectati commanda: ");
    scanf("%d",&command);

    if((command>5)||(command<0))
    {
        error_input_found = 1;
        goto menu_start;
    }
    return command;
}

int main()
{

    int command=100;
    Telefoane * x = NULL;
    int n;
    while(command)
    {
        command = menu();
        switch(command)
        {
        case 1:
        {
            printf("Dati n=");
            scanf("%d",&n);
            x = create_array(n);
            break;
        }
        case 2 ... 4:
        {
            if(x == NULL)
            {
                printf("\nTabloul este NULL!\n");
                break;
            }
            switch(command)
            {
            case 2:
            {
                citire_array(x,n);
                break;
            }
            case 3:
            {
                print_array(x,n);
                break;
            }
            case 4:
            {
                search_by_key(x,n);
                break;
            }
            }
            printf("\n\nApasati orice buton pentru continuare!\n");
            _getch();
        }
        }
    }
    return 0;
}
