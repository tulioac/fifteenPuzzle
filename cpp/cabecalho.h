#ifndef CABECALHO_H
#define CABECALHO_H

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>

// Size of matrix[tam][tam]
#define tam 4

// Numbers that represent the keyboard keys input 
#define KEY_UP 72
#define KEY_DOWN 80
#define KEY_LEFT 75
#define KEY_RIGHT 77
#define KEY_ESCAPE 27


using namespace std;

// Move functions
bool up(int [tam][tam], int &, int &);
bool down(int [tam][tam], int &, int &);
bool left(int [tam][tam], int &, int &);
bool right(int [tam][tam], int &, int &);

// Display the matrix function
void displayMatrix(int [tam][tam]);

// Filling the matrix function
void fillMatrix(int [tam][tam]);

//Display Action Counter
void showCounter(int counter);

#endif