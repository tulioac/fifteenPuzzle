#include "cabecalho.h"

int menu(){
    cout << "Bem vindo ao fifteen puzzle" << endl;
    cout << endl << "Escolha uma dificuldade" << endl;
    cout << "1 - Easy" << endl; 
    cout << "2 - Medium" << endl;
    cout << "3 - Hard" << endl;
    cout << "4 - Very Hard" << endl;
    cout << "5 - Ultimate" << endl;
    int dificuldade;

    cin >> dificuldade;

    return dificuldade;
    }


bool up(int matrix[6][6], int &line, int &column, int tam) {
    // [i][j] => [i-1][j]
    if (line - 1 >= 0) {
        int aux = matrix[line][column];
        matrix[line][column] = matrix[line - 1][column];
        matrix[line - 1][column] = aux;
        line--;
        return true;
    }
    return false;
}

bool down(int matrix[6][6], int &line, int &column, int tam) {
    // [i][j] => [i+1][j]
    if (line + 1 <= tam - 1) {
        int aux = matrix[line][column];
        matrix[line][column] = matrix[line + 1][column];
        matrix[line + 1][column] = aux;
        line++;
        return true;
    }
    return false;
}

bool left(int matrix[6][6], int &line, int &column, int tam) {
    // [i][j] => [i][j-1]
    if (column - 1 >= 0) {
        int aux = matrix[line][column];
        matrix[line][column] = matrix[line][column - 1];
        matrix[line][column - 1] = aux;
        column--;
        return true;
    }  
    return false;  
}

bool right(int matrix[6][6], int &line, int &column, int tam) {
    // [i][j] => [i][j+1]
    if (column + 1 <= tam - 1) {
        int aux = matrix[line][column];
        matrix[line][column] = matrix[line][column + 1];
        matrix[line][column + 1] = aux;
        column++;
        return true;
    }
    return false;
}

void displayMatrix(int matrix[6][6], int tam) {
    for (int i = 0; i < tam; i++) {
        for (int j = 0; j < tam; j++) {
            if (matrix[i][j] == 0) {
                printf("   ");
            } else {
                printf("%.2d ", matrix[i][j]);
            }
        }
        cout << endl;
    }

    cout << endl << endl;
}

void fillSortedArray(int array[], int size) {
    // Fill the array from 1 to size
    for (int i = 0; i < size; i++)
        array[i] = i + 1;
}

void shuffleArray(int array[], int size) {
    // Shuffle the array
    for (int i = size - 1; i > 0; i--) {
        int j = rand() % i;
        array[i] ^= array[j];
        array[j] ^= array[i];
        array[i] ^= array[j];
    }
}

void fillMatrix(int matrix[6][6], int array[], int tam, int size) {
    srand(time(NULL));

    // Assign the shuffled array values to the matrix
    for (int i = 0; i < size; i++)
        matrix[i / tam][i % tam] = array[i];
}

bool checkMatrix(int matrix[6][6], int array[], int tam, int size) {
    // Check if the matrix value is equal to the sorted array
    for (int i = 0; i < size; i++)
        if (matrix[i / tam][i % tam] != array[i])
            return false;
    
    return true;
}

void showCounter(int counter){
    cout << "Numero de jogadas: " << counter << endl;
}