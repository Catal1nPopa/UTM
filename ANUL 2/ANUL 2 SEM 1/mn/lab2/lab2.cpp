#include <iostream>
#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define N 4
#include <time.h>
using namespace std;
clock_t start, stop;
float A[4][4] = {8.1, -0.9, 0.6, 0.8,
                 -0.9, 14.3, 0.3, 0.7,
                 0.6, 0.3, 7.9, -0.4,
                 0.8, 0.7, -0.4, 10.6};
float B[4] = {7.2, 10.3, -11.9, 9.2};
float nota(int w, int z, float h)
{
    int t, t1, t2;
    if (w <= 20)
        t = 10;
    else if (w <= 40 && w < 20)
        t = 9;
    else if (w <= 60 && w < 40)
        t = 8;
    else if (w <= 80 && w < 60)
        t = 7;
    else if (w <= 100 && w < 80)
        t = 6;
    else if (w <= 120 && w < 100)
        t = 5;
    else if (w <= 140 && w < 120)
        t = 4;
    else if (w <= 160 && w < 140)
        t = 3;
    else if (w <= 180 && w < 160)
        t = 2;
    else if (w <= 200 && w < 180)
        t = 1;
    else
        t = 0.5;
    if (z <= 20)
        t = 10;
    else if (z <= 40 && z < 20)
        t = 9;
    else if (z <= 60 && z < 40)
        t = 8;
    else if (z <= 80 && z < 60)
        t = 7;
    else if (z <= 100 && z < 80)
        t = 6;
    else if (z <= 120 && z < 100)
        t = 5;
    else if (z <= 140 && z < 120)
        t = 4;
    else if (z <= 160 && z < 140)
        t = 3;
    else if (z <= 180 && z < 160)
        t = 2;
    else if (z <= 200 && z < 180)
        t = 1;
    if (h <= 0.01)
        t2 = 10;
    else if (h <= 0.1 && h < 0.01)
        t2 = 8;
    else if (h <= 0.2 && h < 0.1)
        t2 = 6;
    else if (h <= 0.3 && h < 0.2)
        t2 = 4;
    else if (h <= 0.4 && h < 0.3)
        t2 = 2;
    else if (h <= 0.5 && h < 0.4)
        t2 = 1;
    else
        t2 = 0.5;
    return ((0.4 * t2 + 0.3 * t1 + 0.3 + t) - 10);
}
void gauss()
{
    int i, j, max, l, w = 0, h = 0, v = 0;
    float t, x[N], a[N][N], b[N];
    start = clock();
    for (i = 0; i < N; i++)
    {
        b[i] = B[i];
        w++;
        for (j = 0; j < N; j++)
            a[i][j] = A[i][j];
    }
    l = 0;
    while (l < N)
    {
        v++;
        for (i = l + 1; i < N; i++)
        {
            w++;
            t = a[i][l] / a[l][l];
            for (j = l; j < N; j++)
                a[i][j] -= t * a[l][j];
            b[i] -= t * b[l];
        }
        l++;
    }
    for (i = N - 1; i >= 0; i--)
    {
        w++;
        t = 0;
        for (j = N - 1; j > i; j--)
            t += a[i][j] * x[j];
        t = b[i] - t;
        x[i] = t / a[i][i];
    }
    printf("Metoda Gauss:\n");
    for (i = 0; i < N; i++)
        printf("%7.3f ", x[i]);
    stop = clock();
    h = (stop - start) / CLK_TCK;
    double s;
    s = nota(w, v, h);
    cout << endl
         << "nota dupa eficacitate " << s << endl;
    cout << "numarul de iteratii " << w << endl;
}
void cholesky()
{
    int i, j, k, w = 0, h = 0, v = 0;
    float t, x[N], l[N][N], y[N];
    start = clock();
    l[0][0] = sqrt(A[0][0]);
    for (i = 1; i < N; i++)
    {
        l[i][0] = A[i][0] / l[0][0];
    }
    for (k = 1; k < N; k++)
    {
        w++;
        t = 0;
        for (j = 0; j < k - 1; j++)
            t += l[k][j] * l[k][j];
        l[k][k] = sqrt(A[k][k] - t);
        for (i = k + 1; i < N; i++)
        {
            t = 0;
            w++;
            for (j = 0; j < k - 1; j++)
                t += l[i][j] * l[k][j];
            l[i][k] = (A[i][k] - t) / l[k][k];
        }
    }
    for (i = 0; i < N; i++)
    {
        w++;
        for (j = i + 1; j < N; j++)
        {
            l[i][j] = l[j][i];
        }
    }
    for (i = 0; i < N; i++)
    {
        t = 0;
        w++;
        for (j = 0; j < i; j++)
            t += l[i][j] * y[j];
        t = B[i] - t;
        y[i] = t / l[i][i];
    }
    for (i = N - 1; i >= 0; i--)
    {
        t = 0;
        w++;
        for (j = N - 1; j > i; j--)
            t += l[i][j] * x[j];
        t = y[i] - t;
        x[i] = t / l[i][i];
    }
    printf("Metoda Cholesky:\n");
    for (i = 0; i < N; i++)
        printf("%7.3f ", x[i]);
    stop = clock();
    h = (stop - start) / CLK_TCK;
    double s;
    s = nota(w, v, h);
    cout << endl
         << "nota dupa eficacitate " << s << endl;
    cout << "numarul de iteratii " << w << endl;
}
void jacobi()
{
    int i, j, m, k1 = 0;
    float v, x[N], q[N][N], d[N], s[N][N], t[N][N], x1[N], er, w = 0, h = 0, z = 0;
    start = clock();
    for (i = 0; i < N; i++)
    {
        w++;
        for (j = 0; j < N; j++)
        {
            if (i == j)
            {
                z++;
                s[i][j] = 1 / A[i][j];
                t[i][j] = 0;
            }
            else
            {
                z++;
                s[i][j] = 0;
                t[i][j] = A[i][j];
            }
        }
    }
    for (i = 0; i < N; i++)
    {
        w++;
        for (j = 0; j < N; j++)
        {
            v = 0;
            for (m = 0; m < N; m++)
                v += s[i][m] * t[m][j];
            q[i][j] = -v;
        }
    }
    for (i = 0; i < N; i++)
    {
        v = 0;
        w++;
        for (m = 0; m < N; m++)
            v += s[i][m] * B[m];
        d[i] = v;
    }
    for (i = 0; i < N; i++)
        x[i] = d[i];
    do
    {
        k1++;
        z++;
        for (i = 0; i < N; i++)
            x1[i] = x[i];
        for (i = 0; i < N; i++)
        {
            v = 0;
            for (m = 0; m < N; m++)
                v += x1[m] * q[i][m];
            x[i] = v + d[i];
        }
        er = fabs(x1[0] - x[0]);
        for (m = 0; m < N; m++)
            if (er < fabs(x1[m] - x[m]))
                er = fabs(x1[m] - x[m]);
    } while (er > 0.001);
    printf("Metoda Jacobi:\n");
    for (i = 0; i < N; i++)
        printf("%7.3f ", x[i]);
    stop = clock();
    h = (stop - start) / CLK_TCK;
    // nota(w,z,h) ;
    cout << endl
         << "nota dupa eficacitate " << nota(w, z, h) << endl;
    cout << "numarul de iteratii " << w << endl;
}
void gaussseidel()
{
    int i, j, m, k1 = 0, k;
    float v, x[N], q[N][N], d[N], s[N][N], t[N][N], x1[N], er, w = 0, h = 0, z = 0;
    start = clock();
    for (i = 0; i < N; i++)
    {
        w++;
        for (j = 0; j < N; j++)
        {
            if (i == j)
            {
                z++;
                s[i][j] = 1 / A[i][j];
                t[i][j] = 0;
            }
            else
            {
                z++;
                s[i][j] = 0;
                t[i][j] = A[i][j];
            }
        }
    };
    for (i = 0; i < N; i++)
    {
        w++;
        for (j = 0; j < N; j++)
        {
            v = 0;
            for (m = 0; m < N; m++)
                v += s[i][m] * t[m][j];
            q[i][j] = -v;
        }
    }
    for (i = 0; i < N; i++)
    {
        w++;
        v = 0;
        for (m = 0; m < N; m++)
            v += s[i][m] * B[m];
        d[i] = v;
    }
    for (i = 0; i < N; i++)
        x[i] = d[i];
    do
    {
        z++;
        k1++;
        for (i = 0; i < N; i++)
            x1[i] = x[i];
        for (i = 0; i < N; i++)
        {
            v = 0;
            for (m = 0; m < N; m++)
                v += x[m] * q[i][m];
            x[i] = v + d[i];
        }
        er = fabs(x1[0] - x[0]);
        for (m = 1; m < N; m++)
            if (er < fabs(x1[m] - x[m]))
                er = fabs(x1[m] - x[m]);
    } while (er > 0.001);
    printf("Metoda Gauss Seidel cu eroarea 0.001:\n");
    for (i = 0; i < N; i++)
        printf("%7.3f ", x[i]);
    printf("\n");
    stop = clock();
    h = (stop - start) / CLK_TCK;
    cout << endl
         << "nota dupa eficacitate " << nota(w, z, h) << endl;
    cout << "numarul de iteratii " << w << endl;
    k1 = 0;
    for (i = 0; i < N; i++)
        x[i] = d[i];
    do
    {
        k1++;
        for (i = 0; i < N; i++)
            x1[i] = x[i];
        for (i = 0; i < N; i++)
        {
            v = 0;
            for (m = 0; m < N; m++)
                v += x[m] * q[i][m];
            x[i] = v + d[i];
        }
        er = fabs(x1[0] - x[0]);
        for (m = 1; m < N; m++)
            if (er < fabs(x1[m] - x[m]))
                er = fabs(x1[m] - x[m]);
    } while (er > 0.00001);
    printf("\nMetoda Gauss Seidel cu eroarea 0.00001:\n");
    for (i = 0; i < N; i++)
        printf("%7.5f ", x[i]);
    cout << endl;
}
void invers()
{
    int i, j, m, k = 0;
    float a[N][2 * N], a1[N][2 * N], I[N][N], v;
    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            a1[i][j] = a[i][j] = A[i][j];
    for (i = 0; i < N; i++)
        for (j = N; j < 2 * N; j++)
            if (j - N == i)
                a1[i][j] = a[i][j] = 1;
            else
                a1[i][j] = a[i][j] = 0;
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            a1[i][j] = a[i][j] / a[i][i];
            a1[i][j + N] = a[i][j + N] / a[i][i];
        }
        for (j = 0; j < N; j++)
            for (m = 0; m < N; m++)
                if (j != i)
                {
                    a1[j][m] = a[j][m] - a[j][i] * a[i][m] / a[i][i];
                    a1[j][m + N] = a[j][m + N] - a[j][i] * a[i][m + N] / a[i][i];
                }
        for (k = 0; k < N; k++)
            for (j = 0; j < 2 * N; j++)
                a[k][j] = a1[k][j];
    }
    puts("Matricea initiala:");
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
            printf("%4.1f ", A[i][j]);
        puts(" ");
    }
    puts("Matricea inversata:");
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < 2 * N; j++)
            printf("%5.2f ", a[i][j]);
        puts(" ");
    }
}
int main()
{
    int i;
    gauss();
    printf("\n");
    cholesky();
    printf("\n");
    jacobi();
    printf("\n");
    gaussseidel();
    printf("\n");
    invers();
    printf("\n");
    getch();
}
