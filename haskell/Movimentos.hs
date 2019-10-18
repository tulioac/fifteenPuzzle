module Movimentos (
    moveEsquerda,
    moveDireita,
    moveBaixo,
    moveCima,
    executaMovimentos
) where

import Arrays

subUm :: Int -> Int
subUm x = x-1

--Pega o índice do "espaço vazio"
getEspVazio :: [Int] -> Int -> Int -> Int
getEspVazio (x:xs) y contador = 
    if(y == x) then contador 
    else getEspVazio (xs) (y) (contador+1)  

substituiValorPosicao :: [Int] -> Int -> Int -> [Int]
substituiValorPosicao (x:xs) 0 valor = [valor] ++ xs
substituiValorPosicao (x:xs) index valor = [x] ++ substituiValorPosicao (xs) (subUm index) (valor)

swapPosicoes :: [Int] -> Int -> Int -> [Int]
swapPosicoes lista index1 index2 = substituiValorPosicao (substituiValorPosicao lista (index1) (lista!!index2)) (index2) (lista!!index1)

moveEsquerda :: [Int] -> Int -> [Int]
moveEsquerda lista dificuldade
    |(x `mod` dificuldade) /= 0 = swapPosicoes (lista) (x) (x-1)
    |otherwise = lista
    where x = getEspVazio (lista) (length (lista)) (0)

moveDireita :: [Int] -> Int -> [Int]
moveDireita lista dificuldade
    |(x `mod` dificuldade) /= dificuldade-1 = swapPosicoes (lista) (x) (x+1)
    |otherwise = lista
    where x = getEspVazio (lista) (length (lista)) (0)

moveCima :: [Int] -> Int -> [Int]
moveCima lista dificuldade
    |x >= dificuldade  = swapPosicoes (lista) (x) (x-dificuldade)
    |otherwise = lista
    where x = getEspVazio (lista) (length (lista)) (0)

moveBaixo :: [Int] -> Int -> [Int]
moveBaixo lista dificuldade
    |x < (dificuldade*(dificuldade-1))  = swapPosicoes (lista) (x) (x+dificuldade)
    |otherwise = lista
    where x = getEspVazio (lista) (length (lista)) (0)

executaMovimentos :: [Int] -> String -> Int -> [Int]
executaMovimentos lista movimento dificuldade
    |isSorted (lista) = lista
    |movimento == "w" = moveCima lista dificuldade
    |movimento == "a" = moveEsquerda lista dificuldade
    |movimento == "s" = moveBaixo lista dificuldade
    |otherwise = moveDireita lista dificuldade