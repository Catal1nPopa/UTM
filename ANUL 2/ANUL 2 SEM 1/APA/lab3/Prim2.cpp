#include <iostream>
#include <cstdlib>
#include <algorithm>
#include <time.h>
#include <tuple>
#include <random>
#include <functional>
using namespace std;
#define INT_MAX 9999

void matrixGraf(int **matrix, unsigned E, unsigned V, int code)
{
    srand(time(0));
    auto gen = bind(uniform_int_distribution<>(0, 1), default_random_engine());
    if (code == 1)
    {
        for (int v = 0; v < V; v++)
            for (int i = 0; i < V; i++)
            {
                if (v != i)
                    matrix[v][i] = matrix[i][v] = rand() % 1000;
            }
    }
    if (code == 2)
    {
        for (int v = 0; v < V; v++)
            for (int i = 0; i < V; i++)
            {
                bool b = gen();
                if (v != i && b)
                    matrix[v][i] = matrix[i][v] = rand() % 1000;
            }
    }
}

tuple<int, int> minKey(int *key, bool *mstSet, unsigned V, int it)
{
    int min = INT_MAX, min_index;
    for (int i = 0; i < V; i++)
    {
        it += 4;
        if (mstSet[i] == false && key[i] < min)
        {
            min = key[i], min_index = i;
            it += 2;
        }
    }
    return make_tuple(min_index, it);
}

void printMST(int *parent, int **graph, unsigned V)
{
    for (int i = 1; i < V; i++)
        cout << "Muchia:  " << i << ": (" << parent[i] << " , " << i << ") cost: "
             << graph[i][parent[i]] << " \n";
}

int **primMST(int **graph, unsigned V, bool matrixNeeded)
{
    int *parent = new int[V];
    int *key = new int[V];
    bool *mstSet = new bool[V];
    int it = 0;
    it += 4;

    for (int i = 0; i < V; i++)
    {
        key[i] = INT_MAX, mstSet[i] = false;
        it += 5;
    }

    key[0] = 0;
    parent[0] = -1;
    it += 2;

    for (int count = 0; count < V - 1; count++)
    {
        it += 4;

        int u = get<0>(minKey(key, mstSet, V, 0));
        it += get<1>(minKey(key, mstSet, V, 0));
        mstSet[u] = true;
        it += 3;

        for (int v = 0; v < V; v++)
        {
            it += 3;
            if (graph[u][v] && mstSet[v] == false && graph[u][v] < key[v])
            {
                it++;
                parent[v] = u, key[v] = graph[u][v];
                it += 2;
            }
        }
    }
    printMST(parent, graph, V);
    cout << endl<< it << "  Iteratii" << endl<< endl;

    if (matrixNeeded == true)
    {
        int **graphOut = new int *[V];
        for (int i = 0; i < V; i++)
        {
            graphOut[i] = new int[V];
            for (int j = 0; j < V; j++)
            {
                graphOut[i][j] = 0;
            }
        }
        for (int i = 0; i < V; i++)
            for (int j = 1; j < V; j++)
            {
                graphOut[parent[j]][j] = graphOut[j][parent[j]] = key[j];
            }
        return graphOut;
    }
}

void matrixGraphPrint(int **graph, unsigned V)
{
    for (int i = 0; i < V; i++)
    {
        for (int j = 0; j < V; j++)
            cout << graph[i][j] << " ";
        cout << endl;
    }
    cout << endl;
}

int find(int i, int *parent)
{
    while (parent[i] != i)
    {
        i = parent[i];
    }
    return i;
}

void union1(int i, int j, int *parent)
{
    int a = find(i, parent);
    int b = find(j, parent);
    parent[a] = b;
}

void kruskalMST(int **cost, int *parent, unsigned V)
{

    int it = 0;
    for (int i = 0; i < V; i++)
    {
        parent[i] = i;
    }

    int edge_count = 0;
    it++;
    while (edge_count < V - 1)
    {
        it += 2;
        int min = INT_MAX, a = -1, b = -1;
        it += 3;
        for (int i = 0; i < V; i++)
        {
            it += 3;
            for (int j = 0; j < V; j++)
            {
                it += 3;
                if (find(i, parent) != find(j, parent) && cost[i][j] <= min)
                {
                    it++;
                    min = cost[i][j];
                    a = i;
                    b = j;
                    it += 3;
                }
            }
        }

        union1(a, b, parent);
        cout << "Muchia " << 1 + edge_count++ << ": (" << a << ", " << b << ") cost: " << min << endl;
    }
    cout << endl<<"Numarul de iteratii: "<< it << endl;
}

int main()
{
    unsigned V;
    srand(time(0));
    cout << "Introduceti numarul de varfuri a grafului: ";
    cin >> V;

    int *parent = new int[V];

    int **matrixFavorabil = new int *[V];
    int **matrixDefavorabil = new int *[V];
    int **matrixRandom = new int *[V];
    for (int i = 0; i < V; i++)
    {
        matrixFavorabil[i] = new int[V];
        matrixDefavorabil[i] = new int[V];
        matrixRandom[i] = new int[V];
        for (int j = 0; j < V; j++)
            matrixFavorabil[i][j] = matrixDefavorabil[i][j] = matrixRandom[i][j] = 0;
    }
    unsigned e = V - 1;

    matrixGraf(matrixDefavorabil, e, V, 1);
    matrixGraf(matrixRandom, e, V, 2);
    cout << "\tAlgoritmul Prim" << endl
         << endl;
    // cout << "Caz defavorabil:" << endl;
    // matrixFavorabil = primMST(matrixDefavorabil, V, true);
    cout << "Caz favorabil:" << endl;
    primMST(matrixFavorabil, V, false);
    // cout << "Caz random:" << endl;
    // primMST(matrixRandom, V, false);

    for (int i = 0; i < V; i++)
    {
        for (int j = 0; j < V; j++)
        {
            if (matrixRandom[i][j] == 0)
                matrixRandom[i][j] = INT_MAX;
            if (matrixFavorabil[i][j] == 0)
                matrixFavorabil[i][j] = INT_MAX;
            if (matrixDefavorabil[i][j] == 0)
                matrixDefavorabil[i][j] = INT_MAX;
        }
    }

    cout << "\tAlgoritmul Kruskal\n\n";
    // cout << "Caz defavorabil:" << endl;
    // kruskalMST(matrixDefavorabil, parent, V);
    cout << "Caz favorabil:" << endl;
    kruskalMST(matrixFavorabil, parent, V);
    // cout << "Caz random:" << endl;
    // kruskalMST(matrixRandom, parent, V);

    return 0;
}
