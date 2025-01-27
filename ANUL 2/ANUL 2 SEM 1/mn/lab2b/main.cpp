#include <iostream>
#include <math.h>
//#include <conio.h>
using namespace std;

float deter(float a[4][4], int k);
int Allo(int lung);
int simetric(int lung);
void factor(int lung);
void trans(int lung);
void determinare(int n);
void Cholesky(int n);
void Iacobi(int n, float Eps);
void Gauss_Seidel(int n, float Eps);
int DiagDom(float a[4][4], int n);
float l[4][4] = {0};
float a[4][4]=
{
        {11.2, 1.5, -1.3, 0.2},
        {1.5, 12.1, -0.9, 0.4},
        {-1.3, -0.9, 11.7, 1.2},
        {0.2, 0.4, 1.2, 14.2}
};
float b[4]={-11.4, 9.7, 8.3, 1.2}, c[4][4], d[4];
int n;
int main()
{

    int n=4, menu;
    cout << "\n|-------------------------|\n";
    cout << "| 1. Metoda lui Cholesky  |\n";
    cout << "| 2. Metoda Jacobi        |\n";
    cout << "| 3. Metoda Gauss-Seidel  |\n";
    cout << "| 0. Exit                 |";
    cout << "\n|-------------------------|\n";
    cout << " >>> ";
    cin >> menu;
    switch (menu)
    {
    case 1:

        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
            {
                c[i][j] = a[i][j];
            }
        cout << "\nTabloul b\n";
        for (int i = 0; i < n; i++)
        {
            d[i] = b[i];
        }

        cout << endl
             << endl
             << " Rezultatele";

        cout << "\n Metoda Cholesky\n\n";
        Cholesky(n);
        cout << endl
             << endl;

        main();
        exit(1);
        break;
    case 2:
        for (int i = 0; i < n; i++) // copiem matricea a in matricea c
            for (int j = 0; j < n; j++)
            {
                c[i][j] = a[i][j];
            }
        cout << "\nTabloul b\n";
        for (int i = 0; i < n; i++) //copiem vectorul d in vectorul b
        {
            d[i] = b[i];
        }
        cout << "\n Metoda Jacobi (Eroarea = 10^-3)\n";
        Iacobi(n, pow(10,-3));
        cout << endl;
        main();
        exit(1);
        break;
    case 3:
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
            {
                c[i][j] = a[i][j];
            }
        for (int i = 0; i < n; i++)
        {
            d[i] = b[i];
        }
        cout << "\n Metoda Gauss-Seidel (Eroarea = 10^-3)\n";
        Gauss_Seidel(n, pow(10,-3));
        cout << endl;
        cout << "\n Metoda Gauss-Seidel (Eroarea = 10^-5)\n";
        Gauss_Seidel(n, pow(10,-5));
        cout << endl;

        main();
        exit(1);
        break;
    default:
        cout << "Optiune gresita!";
        break;
    case 0:
        return 0;
    }
}
void Cholesky(int n)
{
    if (!Allo(n))
    {
        cout << "\nAceasta matricea nu este pozitiv definita!\n";
        main();
        exit(1);
        goto E;
    }
    if (!simetric(n))
    {
        cout << "\nAceasta matricea nu este simetrica !\n";

        main();
        exit(1);
    }
    determinare(n);
E:;
}
//------------------------------------------
float deter(float a[4][4], int k)
{
    if (k == 1)
        return a[0][0];
    if (k == 2)
        return a[0][0] * a[1][1] - a[0][1] * a[1][0];
    float s = 0;
    float t[4][4] = {0};
    for (int i = 0; i < k; i++)
    {
        int x = 0;
        for (int l = 0; l < k; l++)
        {
            if (l != i)
            {
                for (int m = 1; m < k; m++)
                    t[x][m - 1] = a[l][m];
                x++;
            }
        }
        if (i % 2 == 0)
            s += a[i][0] * deter(t, k - 1);
        else
            s -= a[i][0] * deter(t, k - 1);
    }
    return s;
}
//------------------------------------------
// Functia verifica daca matricea e pozitiv definita
int Allo(int n)
{
    for (int i = 0; i < n; i++)
        if (a[i][i] <= 0 || deter(a, i + 1) <= 0)
            return 0;
    return 1;
}
//------------------------------------------
int simetric(int n)
{
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            if (a[i][j] != a[j][i])
                return 0;
    return 1;
}
//------------------------------------------
void factor(int n)
{
    l[0][0] = (float)sqrt(a[0][0]);
    for (int i = 0; i < n; i++)
        l[i][0] = a[i][0] / l[0][0];
    for (int i = 1; i < n; i++)
    {
        float t = 0;
        for (int j = 0; j < i; j++)
            t += l[i][j] * l[i][j];
        l[i][i] = (float)sqrt(a[i][i] - t);
        for (int j = i; j < n; j++)
        {
            float t1 = 0;
            for (int k = 0; k < i; k++)
                t1 += l[j][k] * l[i][k];
            l[j][i] = (a[j][i] - t1) / l[i][i];
        }
    }
}
//------------------------------------------
void trans(int n)
{
    float t = 0;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < i; j++)
        {
            t = l[i][j];
            l[i][j] = l[j][i];
            l[j][i] = t;
        }
}
//------------------------------------------
void determinare(int n)
{
    factor(n);
    float y[4], x[4];
    y[0] = b[0] / l[0][0];
    for (int i = 0; i < n; i++)
    {
        float t = 0;
        for (int j = 0; j < i; j++)
            t += l[i][j] * y[j];
        y[i] = (b[i] - t) / l[i][i];
    }
    trans(n);

    cout << "Matricea triughiular inferioara:\n";
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            cout << l[j][i] << "\t";
        }
        cout << endl;
    }
    x[n - 1] = y[n - 1] / l[n - 1][n - 1];
    float t;
    for (int i = n - 2; i >= 0; i--)
    {
        t = 0;
        for (int j = i + 1; j < n; j++)
            t += l[i][j] * x[j];
        x[i] = (y[i] - t) / l[i][i];
    }
    cout << "\nRezultatele x si y:\n";
    for (int i = 0; i < n; i++)
        cout << " x" << i + 1 << " = " << x[i] << '\t'<< " y" << i + 1 << " = " << y[i] << "\n";
}
//-------------------------------------
void Iacobi(int n, float Eps)
{
    float x[4], x1[4], q[4][4] = {0}, d[4], t, max;
    int ni = 0;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            if (i != j)
                q[i][j] = -(a[i][j] / a[i][i]);
            else
                q[i][j] = 0;
    if (!DiagDom(a, n))
    {
        cout << "Aceasta matricea nu este diagonal dominata\n";

        main();
        exit(1);
        goto E;
    }
    for (int i = 0; i < n; i++)
        d[i] = b[i] / a[i][i];
    for (int i = 0; i < n; i++)
        x[i] = d[i];
    do
    {
        for (int i = 0; i < n; i++)
            x1[i] = x[i];
        for (int i = 0; i < n; i++)
        {
            t = 0;
            for (int j = 0; j < n; j++)
                t += q[i][j] * x1[j]; // Jakobi
            x[i] = t + d[i];
        }
        max = (float)fabs(x[0] - x1[0]);
        for (int i = 1; i < n; i++)
            if ((float)fabs(x[i] - x1[i]) > max)
                max = (float)fabs(x[i] - x1[i]);
        ni++;
    } while (max > Eps);
    cout << "\nRezultatele x:\n";
    for (int i = 0; i < n; i++)
        cout << "x" << i + 1 << " = " << x[i] << endl;
    cout << "\nNumarul iteratiilor = " << ni << endl;
E:;
}
//-------------------------------------
int DiagDom(float a[4][4], int n)
{
    float s;
    for (int i = 0; i < n; i++)
    {
        s = 0;
        for (int j = 0; j < n; j++)
            if (i != j)
                s += a[i][j];
        if (a[i][i] < s)
            return 0;
        if (a[i][i] == 0)
            return 0;
    }
    return 1;
}
//-----------------------------
void Gauss_Seidel(int n, float Eps)
{
    float x[4], x1[4], q[4][4] = {0}, d[4], t, max;
    int ni = 0;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            if (i != j)
                q[i][j] = -(a[i][j] / a[i][i]);
            else
                q[i][j] = 0;
    if (!DiagDom(a, n))
    {
        cout << "Aceasta matricea nu este diagonal dominata\n";

        main();
        exit(1);
        goto E;
    }
    for (int i = 0; i < n; i++)
        d[i] = b[i] / a[i][i];
    for (int i = 0; i < n; i++)
        x[i] = d[i];
    do
    {
        for (int i = 0; i < n; i++)
            x1[i] = x[i];
        for (int i = 0; i < n; i++)
        {
            t = 0;
            for (int j = 0; j < n; j++)
                t += q[i][j] * x[j]; // Gauss - Seidel
            x[i] = t + d[i];
        }
        max = (float)fabs(x[0] - x1[0]);
        for (int i = 1; i < n; i++)
            if ((float)fabs(x[i] - x1[i]) > max)
                max = (float)fabs(x[i] - x1[i]);
        ni++;
    } while (max > Eps);
    cout << "\nRezultatele x:\n";
    for (int i = 0; i < n; i++)
        cout << "x" << i + 1 << " = " << x[i] << endl;
    cout << "\nNumarul iteratiilor = " << ni << endl;
E:;
}
