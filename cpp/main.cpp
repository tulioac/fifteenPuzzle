#include "cabecalho.h"

// g++ -o main .\main.cpp .\cabecalho.h .\implementacao.cpp

using namespace std;

int main() {
    int matrix[tam][tam] = {100};

    fillMatrix(matrix);

    // 01 02 03 04
    // 05 06 07 08
    // 09 10 11 12
    // 13 14 15 00

    /*int linha = tam - 1;
    int coluna = tam - 1;

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
    exibeMatriz(matriz);*/

    return 0;
}
