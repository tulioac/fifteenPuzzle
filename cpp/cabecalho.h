#ifndef CABECALHO_H
#define CABECALHO_H

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>

// Size of matrix[tam][tam]
#define tam 2
#define size (tam*tam - 1)

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

// Fill an array from 1 to the size
void fillSortedArray(int []);

// Shuffle an array
void shuffleArray(int []);

// Filling the matrix function
void fillMatrix(int [tam][tam], int[size]);

// Check if the matrix is sorted
bool checkMatrix(int [tam][tam], int[size]);

//Display Action Counter
void showCounter(int counter);

#endif