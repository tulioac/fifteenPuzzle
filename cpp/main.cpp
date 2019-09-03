#include <iostream>

// Tamanho da matriz[tam][tam]
#define tam 4

using namespace std;

// Esqueleto das funções

// Funções de movimento
// FIXME: Conferir se está nos limites
void up(int matriz[tam][tam], int &linha, int &coluna);
void down(int matriz[tam][tam], int &linha, int &coluna);
void left(int matriz[tam][tam], int &linha, int &coluna);
void right(int matriz[tam][tam], int &linha, int &coluna);

// Função de exibição da matriz
void exibeMatriz(int matriz[tam][tam]);

// TODO: Conferir se está ordenada
// TODO: Aumentar a dificuldade de acordo com o tamanho da matriz
// TODO: Contador de movimentos
// TODO: Cronômetro

// TODO: Allegro 5 - Eventos de teclado
// TODO: Allegro 5 - Interface gráfica

int main() {
    int matriz[tam][tam] = {{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}, {13, 14, 15, 0}};

    // 01 02 03 04
    // 05 06 07 08
    // 09 10 11 12
    // 13 14 15 00

    int linha = 3;
    int coluna = 3;

    cout << "Inicial" << endl;
    cout << "Linha " << linha << " / Coluna " << coluna << endl;
    exibeMatriz(matriz);

    up(matriz, linha, coluna);
    cout << "Linha " << linha << " / Coluna " << coluna << endl;
    exibeMatriz(matriz);

    left(matriz, linha, coluna);
    cout << "Linha " << linha << " / Coluna " << coluna << endl;
    exibeMatriz(matriz);
    
    down(matriz, linha, coluna);
    cout << "Linha " << linha << " / Coluna " << coluna << endl;
    exibeMatriz(matriz);
    
    right(matriz, linha, coluna);
    cout << "Linha " << linha << " / Coluna " << coluna << endl;
    exibeMatriz(matriz);

    return 0;
}

void up(int matriz[tam][tam], int &linha, int &coluna) {
    // [i][j] => [i-1][j]
    cout << "up()" << endl;
    int aux = matriz[linha][coluna];
    matriz[linha][coluna] = matriz[linha - 1][coluna];
    matriz[linha - 1][coluna] = aux;
    linha--;
}

void down(int matriz[tam][tam], int &linha, int &coluna) {
    // [i][j] => [i+1][j]
    cout << "down()" << endl;
    int aux = matriz[linha][coluna];
    matriz[linha][coluna] = matriz[linha + 1][coluna];
    matriz[linha + 1][coluna] = aux;
    linha++;
}

void left(int matriz[tam][tam], int &linha, int &coluna) {
    // [i][j] => [i][j-1]
    cout << "left()" << endl;
    int aux = matriz[linha][coluna];
    matriz[linha][coluna] = matriz[linha][coluna - 1];
    matriz[linha][coluna - 1] = aux;
    coluna--;
    
}

void right(int matriz[tam][tam], int &linha, int &coluna) {
    // [i][j] => [i][j+1]
    cout << "right()" << endl;
    int aux = matriz[linha][coluna];
    matriz[linha][coluna] = matriz[linha][coluna + 1];
    matriz[linha][coluna + 1] = aux;
    coluna++;
}

void exibeMatriz(int matriz[tam][tam]) {
    for (int i = 0; i < tam; i++)
    {
        for (int j = 0; j < tam; j++)
        {
            printf("%.2d ", matriz[i][j]);
            // cout << matriz[i][j] << " ";
        }
        cout << endl;
    }

    cout << endl << endl;
}