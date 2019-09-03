#include "cabecalho.h"

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
    for (int i = 0; i < tam; i++) {
        for (int j = 0; j < tam; j++) {
            printf("%.2d ", matriz[i][j]);
            // cout << matriz[i][j] << " ";
        }
        cout << endl;
    }

    cout << endl << endl;
}

void preencheMatriz(int matriz[tam][tam]) {
    int size = tam*tam - 1;
    int array[size];

    srand(time(NULL));

    cout << "Original" << endl;
    for (int i = 0; i < size; i++) {
        array[i] = i + 1;
        cout << array[i] << " ";
    }

    for (int i = size - 1; i > 0; i--) {
        int j = rand() % i;
        array[i] ^= array[j];
        array[j] ^= array[i];
        array[i] ^= array[j];
    }

    cout << endl << endl;
    for (int i = 0; i < size; i++) {
        cout << array[i] << " ";
    }
}