#ifndef CABECALHO_H
#define CABECALHO_H

#include <iostream>
#include <stdio.h>

// Tamanho da matriz[tam][tam]
#define tam 4

using namespace std;

// Funções de movimento
void up(int [tam][tam], int &, int &);
void down(int [tam][tam], int &, int &);
void left(int [tam][tam], int &, int &);
void right(int [tam][tam], int &, int &);

// Função de exibição da matriz
void exibeMatriz(int [tam][tam]);


#endif