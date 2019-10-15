module FuncoesMain (
    exibeDificuldades,
    solicitaDificuldade,
    criaArrayOrdenado,
    embaralhaArray
) where

import System.Random

exibeDificuldades :: IO()
exibeDificuldades =
    putStrLn $ 
        ("1 - Easy") ++ "\n" ++ 
        ("2 - Medium") ++ "\n" ++
        ("3 - Hard") ++ "\n" ++
        ("4 - Very Hard") ++ "\n" ++
        ("5 - Ultimate")

solicitaDificuldade :: IO Int
solicitaDificuldade = 
    do
        putStrLn ("Digite a dificuldade desejada")
        dificuldade <- getLine
        return (read (dificuldade))

criaArrayOrdenado :: Int -> [Int]
criaArrayOrdenado tamanho = [1..(tamanho ^ 2 - 1)]

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

raizQuadradaInteira :: Int -> Int
raizQuadradaInteira n = aux n
    where
        aux x
            | x*x > n = aux (x - 1)
            | otherwise = x