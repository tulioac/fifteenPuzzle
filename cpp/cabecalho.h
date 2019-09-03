#ifndef CABECALHO_H
#define CABECALHO_H

#include <iostream>
#include <stdio.h>

// Tamanho da matriz[tam][tam]
#define tam 4

using namespace std;

// Esqueleto das funções

// Funções de movimento
// FIXME: Conferir se está nos limites
void up(int [tam][tam], int &, int &);
void down(int [tam][tam], int &, int &);
void left(int [tam][tam], int &, int &);
void right(int [tam][tam], int &, int &);

// Função de exibição da matriz
void exibeMatriz(int [tam][tam]);

// TODO: Conferir se está ordenada
// TODO: Aumentar a dificuldade de acordo com o tamanho da matriz
// TODO: Contador de movimentos
// TODO: Cronômetro
// TODO: Preencher a matriz com for

// TODO: Allegro 5 - Eventos de teclado
// TODO: Allegro 5 - Interface gráfica


#endif