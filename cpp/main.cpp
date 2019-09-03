#include "cabecalho.h"

// g++ -o main .\main.cpp .\cabecalho.h .\implementacao.cpp

using namespace std;

int main() {
    int matrix[tam][tam] = {100};

    fillMatrix(matrix);
    int line = tam - 1;
    int column = tam - 1;

    bool playing = true;
    int key = 0;

    cout << "Que comecem os jogos..." << endl << endl;

    while (playing) {
        displayMatrix(matrix);
        key = 0;

        switch ((key = getch())) {
        case KEY_UP:
            down(matrix, line, column);
            break;

        case KEY_DOWN:
            up(matrix, line, column);
            break;

        case KEY_RIGHT:
            left(matrix, line, column);
            break;

        case KEY_LEFT:
            right(matrix, line, column);
            break;
        
        case KEY_ESCAPE:
            cout << "Adios" << endl;
            playing = false;
            break;

        default:
            break;
        }
        system("cls");

        // TODO: Conferir se está ordenado
    }

    return 0;
}
