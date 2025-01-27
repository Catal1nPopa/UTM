#include <iostream>
#include <array>
#include <conio.h>
#include <windows.h>
#include <limits>
#include <chrono>
using namespace std::chrono;
using namespace std;

long int it=0;
////////////////////////////////// Merge sort

void merge(int arr[], int left, int mid, int right)
{

    int size1 = mid - left + 1;
    it += 3;
    int size2 = right - mid;
    it += 2;
    int *L = new int[size1];
    int *R = new int[size2];

    for (int i = 0; i < size1; i++)
    {
        it += 2;
        L[i] = arr[left + i];
        it += 3;
    }
    for (int j = 0; j < size2; j++)
    {
        it += 3;
        R[j] = arr[mid + 1 + j];
        it += 3;
    }

    int i, j, k;
    i = 0;
    j = 0;
    k = left;
    it += 3;

    while (i < size1 && j < size2)
    {
        it += 2;
        if (L[i] <= R[j])
        {
            it += 2;
            arr[k] = L[i];
            i++;
            it += 1;
        }
        else
        {
            arr[k] = R[j];
            j++;
            it += 2;
        }
        k++;
        it++;
    }
    while (i < size1)
    {
        it++;
        arr[k] = L[i];
        i++;
        k++;
        it += 3;
    }

    while (j < size2)
    {
        it++;
        arr[k] = R[j];
        j++;
        k++;
        it += 3;
    }
}

void merge_sort(int arr[], int begin, int end)
{
    if (begin < end)
    {
        it +=1;
        int midlle = ((begin + end) / 2);
        it += 3;
        merge_sort(arr, begin, midlle);
        merge_sort(arr, midlle + 1, end);
        it++;
        merge(arr, begin, midlle, end);
    }
}
////////////////////////////////////////////////////Bubble


void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
    it+=3;
}
void bubble_sort(int arr[], int size)
{
    int i, j;
    for (i = 0; i < size - 1; i++)
    {
        it += 4;
        for (j = 0; j < size - i - 1; j++)
        {
            it += 4;
            if (arr[j] > arr[j + 1])
            {
                it += 2;
                swap(arr[j], arr[j + 1]);
                it += 1;
            }
        }
    }
}


/// ///////////////////////////////////////////Quick

int partition (int arr[], int low, int high) 
{ 
    int pivot = arr[high];   
    int i = (low - 1);   
    it += 3;
   
    for (int j = low; j <= high- 1; j++) 
    { 
        it += 5;
        if (arr[j] <= pivot) 
        { 
            i++;  
            it += 3;
            swap(&arr[i], &arr[j]); 
        } 
    } 
    swap(&arr[i + 1], &arr[high]); 
    it += 2;
    return (i + 1); 
} 

void quickSort(int arr[], int low, int high) 
{ 
    if (low < high) 
    { 
        it += 1;
        int pivot = partition(arr, low, high); 
        quickSort(arr, low, pivot - 1); 
        quickSort(arr, pivot + 1, high); 
        it += 3;
    } 
}

//////////////////////////////////////////////////
int *new_array(int size)
{
    int value;
    int j = 0;
    int *ar = new int[size];
    int *ar2 = new int[size];
    cout << "\n1.Cazul favorabil\n2.Random\n3.Cazul defavorabil\n";
    cin >> value;

    if (value == 1)
    {
        for (int i = 0; i < size; i++)
        {
            ar[i] = i;
        }
    }
    else if (value == 2)
    {
        for (int i = 0; i < size; i++)
        {
            int x = rand() % size;
            ar[i] = x;
        }
    }
    else if (value == 3)
    {
        for (int i = 0; i < size; i++)
        {
            ar2[i] = i;
        }
        for (int i = size - 1; i >= 0;)
        {
            ar[j++] = ar2[i--];
        }
    }
    return ar;
}

////////////////////////////////////////////////
void printArray(int arr[], int size)
{
    for (auto i = 0; i < size; i++)
        cout << arr[i] << " ";
}
/////////////////////////////////////////////////

int menu()
{
    int error_input_found = 0;
menu_start:
    system("cls");
    cout << "|           Menu                    |\n";
    printf("|    1.Dati lungimea tabloului       |\n");
    printf("|           2.Merge                  |\n");
    printf("|           3.Bubble                 |\n");
    printf("|           4.Quick                  |\n");
    printf("|           5.Afisarea               |\n");

    int chose = 9;
    if (error_input_found)
    {
        printf("\n\nSelectati o comanda : \n");
    }
    printf("\n\nCommand : ");
    cin >> chose;
    while (1)
    {
        if (cin.fail())
        {
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            system("cls");
            goto menu_start;
        }
        if (!cin.fail())
            return chose;
        break;
    }
}

int main()
{
    int *ar = NULL;
    int size;

    int j = 0;
    int *ar2 = new int[size];

    int chose = 5;
    while (chose != 0)
    {
        chose = menu();
        switch (chose)
        {
        case 1:
            cout << "\n----\n";
            cin >> size;
            break;
        case 2:
        {
            it = 0;
            auto start = high_resolution_clock::now();
            cout << "\nMerge sort: \n";
            ar = new_array(size);
            merge_sort(ar, 0, size);
            auto stop = high_resolution_clock::now();
            cout << "\nNumarul de iteratii: "<< it;
            auto duration = duration_cast<microseconds>(stop - start);
            cout << "\nTimpul: "<< duration.count() << " microsecunde" << endl;
            break;
        }
        case 3:
        {
            it = 0;
            auto start = high_resolution_clock::now();
            cout << "\nBubble sort: \n";
            ar = new_array(size);
            bubble_sort(ar, size);
            auto stop = high_resolution_clock::now();
            cout << "\nNumarul de iteratii: "<< it;
            auto duration = duration_cast<microseconds>(stop - start);
             cout << "\nTimpul: "<< duration.count() << " microsecunde" << endl;
            break;
        }
        case 4:
        {
            it = 0;
            auto start = high_resolution_clock::now();
            cout << "\nQuick sort: \n";
            ar = new_array(size);
            quickSort(ar, 0, size-1);
            auto stop = high_resolution_clock::now();
            cout << "\nNumarul de iteratii: "<< it;
            auto duration = duration_cast<microseconds>(stop - start);
             cout << "\nTimpul: "<< duration.count() << " microsecunde" << endl;
            break;
        }
        case 5:
        {   
            cout << "\nAfisarea tabloului:\n";
            printArray(ar, size);
        }
        break;
        case 0:
            exit(0);
            break;
        default:
            break;
        }
        printf("\n\nPress any Key to continue!\n");
        _getch();
    }
    return 0;
}

