module Jogo (
    executaMovimentos,
    isSorted,
    getHead
) where

import Implementacao

executaMovimentos:: [Int] -> String -> Int -> [Int]
executaMovimentos lista movimento dificuldade
    |isSorted (lista) = lista
    |movimento == "w" = moveCima lista dificuldade
    |movimento == "a" = moveEsquerda lista dificuldade
    |movimento == "s" = moveBaixo lista dificuldade
    |otherwise = moveDireita lista dificuldade

isSorted:: [Int] -> Bool
isSorted (x:xs)
    |xs == [] = True
    |x<getHead (xs) = isSorted (xs)
    |otherwise = False

getHead:: [Int] -> Int
getHead (x:xs) = x
--Espera movimento
--Recebe movimento e chama funcão 'movimento' passando esse como parâmetro
