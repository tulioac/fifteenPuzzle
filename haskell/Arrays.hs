module Arrays (
    criaArrayOrdenado, 
    embaralhaArray,
    isSorted, 
    getHead,
) where

import System.Random

criaArrayOrdenado :: Int -> [Int]
criaArrayOrdenado tamanho = [1..(tamanho ^ 2)]

embaralhaArray array = 
    if 
        length array < 2 
    then 
        return array 
    else 
        do
            i <- System.Random.randomRIO (0, length (array) - 1)
            r <- embaralhaArray (take i array ++ drop (i + 1) array)
            return (array!!i : r)

isSorted:: [Int] -> Bool
isSorted (x:xs)
    |xs == [] = True
    |x<getHead (xs) = isSorted (xs)
    |otherwise = False

getHead:: [Int] -> Int
getHead (x:xs) = x
--Espera movimento
--Recebe movimento e chama funcão 'movimento' passando esse como parâmetro