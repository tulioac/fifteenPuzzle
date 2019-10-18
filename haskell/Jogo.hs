module Jogo (
    executaMovimentos,
    isSorted,
    getHead
) where

import Implementacao

executaMovimentos:: [Int] -> String -> [Int]
executaMovimentos lista movimento
    |isSorted (lista) = lista
    |movimento == "w" = moveCima (lista)
    |movimento == "a" = moveEsquerda (lista)
    |movimento == "s" = moveBaixo (lista)
    |otherwise = moveDireita (lista)

  

isSorted:: [Int] -> Bool
isSorted (x:xs)
    |xs == [] = True
    |x<getHead (xs) = isSorted (xs)
    |otherwise = False

getHead:: [Int] -> Int
getHead (x:xs) = x
--Espera movimento
--Recebe movimento e chama funcão 'movimento' passando esse como parâmetro
