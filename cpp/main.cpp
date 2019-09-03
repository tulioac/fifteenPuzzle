#include <iostream>

#define tam 3

using namespace std;

void up(int matriz[tam][tam], int &linha, int &coluna);

void exibeMatriz(int matriz[tam][tam]);

int main()
{
    int matriz[tam][tam] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 0}};

    int linha = 2;
    int coluna = 2;

    cout << "Linha " << linha << " / Coluna: " << coluna << endl;

    exibeMatriz(matriz);
    up(matriz, linha, coluna);
    exibeMatriz(matriz);

    cout << "Linha " << linha << " / Coluna: " << coluna << endl;

    return 0;
}

void up(int matriz[tam][tam], int &linha, int &coluna) {
    // [i][j] => [i-1][j]
    int aux = matriz[linha][coluna];
    matriz[linha][coluna] = matriz[linha - 1][coluna];
    matriz[linha - 1][coluna] = aux;
    linha--;
}

void exibeMatriz(int matriz[tam][tam]) {
    for (int i = 0; i < tam; i++)
    {
        for (int j = 0; j < tam; j++)
        {
            cout << matriz[i][j] << " ";
        }
        cout << endl;
    }

    cout << endl << endl;
}