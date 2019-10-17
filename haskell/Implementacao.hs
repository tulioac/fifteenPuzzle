module Implementacao (
    moveEsquerda,
    moveDireita,
    moveBaixo,
    moveCima
) where

subUm:: Int -> Int
subUm x = x-1

--Pega o índice do "espaço vazio"
getEspVazio:: [Int] -> Int -> Int -> Int
getEspVazio (x:xs) y contador = 
    if(y == x) then contador 
    else getEspVazio (xs) (y) (contador+1)  

substituiValorPosicao:: [Int] -> Int -> Int -> [Int]
substituiValorPosicao (x:xs) 0 valor = [valor] ++ xs
substituiValorPosicao (x:xs) index valor = [x] ++ substituiValorPosicao (xs) (subUm index) (valor)

swapPosicoes:: [Int] -> Int -> Int -> [Int]
swapPosicoes lista index1 index2 = substituiValorPosicao (substituiValorPosicao lista (index1) (lista!!index2)) (index2) (lista!!index1)

dificuldade = 3

moveEsquerda:: [Int] -> [Int]
moveEsquerda lista
    |(x `mod` dificuldade) /= 0 = swapPosicoes (lista) (x) (x-1)
    |otherwise = lista
    where x = getEspVazio (lista) (length (lista)) (0)

moveDireita:: [Int] -> [Int]
moveDireita lista
    |(x `mod` dificuldade) /= dificuldade-1 = swapPosicoes (lista) (x) (x+1)
    |otherwise = lista
    where x = getEspVazio (lista) (length (lista)) (0)

moveCima:: [Int] -> [Int]
moveCima lista
    |x >= dificuldade  = swapPosicoes (lista) (x) (x-dificuldade)
    |otherwise = lista
    where x = getEspVazio (lista) (length (lista)) (0)

moveBaixo:: [Int] -> [Int]
moveBaixo lista
    |x < (dificuldade*(dificuldade-1))  = swapPosicoes (lista) (x) (x+dificuldade)
    |otherwise = lista
    where x = getEspVazio (lista) (length (lista)) (0)