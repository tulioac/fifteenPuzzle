#include "cabecalho.h"

// g++ -o main .\main.cpp .\cabecalho.h .\implementacao.cpp

using namespace std;

int main() {

    int dificuldade = menu();
    
    // Size of the matrix[tam][tam]
    int tam = dificuldade+1;
    int size = tam*tam -1;
    
    // Creates and fill an array from 1 to size and shuffles it
    int array[size];
    fillSortedArray(array, size);
    shuffleArray(array, size);

    // Creates the matrix, fill with the array and shuffles the array values
    int matrix[6][6] = {0};
    fillMatrix(matrix, array, tam, size);

    // Sorted the array to later compare with the matrix
    fillSortedArray(array, size);

    // Initialize the position of the gap
    int line = tam - 1;
    int column = tam - 1;

    bool playing = true;
    int key = 0;

    int actionCounter = 0;

    cout << "Que comecem os jogos..." << endl << endl;

    Sleep(2000);

    while (playing) {


        showCounter(actionCounter);
        displayMatrix(matrix, tam);
        key = 0;

        switch ((key = getch())) {
        case KEY_UP:
            if (down(matrix, line, column, tam)) 
                actionCounter++;
            break;

        case KEY_DOWN:
            if (up(matrix, line, column, tam)) 
                actionCounter++;
            break;

        case KEY_RIGHT:
            if (left(matrix, line, column, tam)) 
                actionCounter++;
            break;

        case KEY_LEFT:
            if (right(matrix, line, column, tam)) 
                actionCounter++;
            break;
        
        case KEY_ESCAPE:
            playing = false;
            cout << "Adios" << endl << endl;
            Sleep(2000);
            break;

        default:
            break;
        }

        system("cls");

        if (checkMatrix(matrix, array, tam, size)) {
            playing = false;
            cout << "Voce ganhou! Parabens!" << endl <<
            "Foram necessarias apenas " << actionCounter << " jogadas para finalizar o jogo!" << endl << endl;
        }
    }

    return 0;
}
