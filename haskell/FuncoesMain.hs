module FuncoesMain (
    exibeDificuldades,
    solicitaDificuldade,
    solicitaMovimento,
    criaArrayOrdenado,
    embaralhaArray,
    mostraNaTela,
    clearScreen
) where

import System.Random
import System.Process as SP


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
        putStrLn ("Digite de 1 a 5 para seleciona a dificuldade desejada")
        dificuldade <- getLine
        if(read (dificuldade) > 5) then solicitaDificuldade
        else
            do
                return (read (dificuldade))

solicitaMovimento :: IO String
solicitaMovimento =
    do
        putStrLn("Digite w a s d, para se encaixar as peças no local vazio!")
        movimento <- getLine
        if(movimento /= "w" && movimento /="s" && movimento /= "a" && movimento /= "d") then solicitaMovimento
        else
            do
                return movimento

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

mostraNaTela:: [Int] -> Int -> Int -> String -> String
mostraNaTela (x:xs) contador dificuldade saida
    | (contador == (dificuldade^2)-1) = (saida++((exibe(x)(dificuldade))++"]\n"))
    | ((contador `mod` dificuldade) == 0) = mostraNaTela (xs) (contador+1) (dificuldade) (saida++("["++(exibe(x)(dificuldade))++","))
    | ((contador `mod` dificuldade) == dificuldade-1) = mostraNaTela (xs) (contador+1) (dificuldade) (saida++((exibe(x)(dificuldade))++"]\n")) 
    | otherwise = mostraNaTela (xs) (contador+1) (dificuldade) (saida++ ((exibe(x)(dificuldade))++",")) 

exibe:: Int -> Int -> String
exibe numero dificuldade
    | numero == dificuldade^2 = " "
    | otherwise = show(numero)

clearScreen :: IO ()
clearScreen = do
    SP.system "cls"
    return ()

raizQuadradaInteira :: Int -> Int
raizQuadradaInteira n = aux n
    where
        aux x
            | x * x > n = aux (x - 1)
            | otherwise = x