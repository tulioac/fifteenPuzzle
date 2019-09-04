#include "cabecalho.h"

// g++ -o main .\main.cpp .\cabecalho.h .\implementacao.cpp

using namespace std;

int main() {

    int matrix[tam][tam] = {0};

    fillMatrix(matrix);
    int line = tam - 1;
    int column = tam - 1;

    bool playing = true;
    int key = 0;

    int actionCounter = 0;

    cout << "Que comecem os jogos..." << endl << endl;

    while (playing) {

        showCounter(actionCounter);
        displayMatrix(matrix);
        key = 0;

        switch ((key = getch())) {
        case KEY_UP:
            if (down(matrix, line, column)) 
                actionCounter++;
            break;

        case KEY_DOWN:
            if (up(matrix, line, column)) 
                actionCounter++;
            break;

        case KEY_RIGHT:
            if (left(matrix, line, column)) 
                actionCounter++;
            break;

        case KEY_LEFT:
            if (right(matrix, line, column)) 
                actionCounter++;
            break;
        
        case KEY_ESCAPE:
            playing = false;
            break;

        default:
            break;
        }

        system("cls");

        // TODO: Conferir se está ordenado
    }

    cout << "Adios" << endl;

    return 0;
}
