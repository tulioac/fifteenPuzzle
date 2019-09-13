#ifndef CABECALHO_H
#define CABECALHO_H

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>


// Numbers that represent the keyboard keys input 
#define KEY_UP 72
#define KEY_DOWN 80
#define KEY_LEFT 75
#define KEY_RIGHT 77
#define KEY_ESCAPE 27


using namespace std;

//Menu
int menu();

// Move functions
bool up(int [6][6], int &, int &, int);
bool down(int [6][6], int &, int &, int);
bool left(int [6][6], int &, int &, int);
bool right(int [6][6], int &, int &, int);

// Display the matrix function
void displayMatrix(int [6][6], int);

// Fill an array from 1 to the 
void fillSortedArray(int [], int);

// Shuffle an array
void shuffleArray(int [], int);

// Filling the matrix function
void fillMatrix(int [6][6], int[], int, int);

// Check if the matrix is sorted
bool checkMatrix(int [6][6], int[], int, int);

//Display Action Counter
void showCounter(int counter);

#endif