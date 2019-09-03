#ifndef CABECALHO_H
#define CABECALHO_H

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Size of matrix[tam][tam]
#define tam 4

using namespace std;

// Move functions
void up(int [tam][tam], int &, int &);
void down(int [tam][tam], int &, int &);
void left(int [tam][tam], int &, int &);
void right(int [tam][tam], int &, int &);

// Display the matrix function
void displayMatrix(int [tam][tam]);

// Filling the matrix function
void fillMatrix(int [tam][tam]);

#endif