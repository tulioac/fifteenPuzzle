module FuncoesIO (
    exibeDificuldades,
    solicitaDificuldade,
    mostraNaTela,
    clearScreen,
    executaOperacoes,
    solicitaMovimento,
    novoSolicitaMovimento
) where

import Util
import Arrays
import Movimentos
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

novoSolicitaMovimento :: IO String
novoSolicitaMovimento =
    do
        putStrLn("Use as setas, para encaixar as peças no local vazio!")
        u <- getKey
        case u of
            Just a -> case a of
                U -> return "s"
                D -> return "w"
                L -> return "d"
                R -> return "a"
                O -> return ""


executaOperacoes :: [Int] -> Int -> Int -> IO ()
executaOperacoes lista dificuldade operacoes = do
    if(isSorted (lista)) then putStrLn("Ganhoooooooou")
    else do
        mov <- novoSolicitaMovimento
        if(mov == "") then putStrLn ("Perdeeeeeeeu")
        else
            do
                let novaLista = executaMovimentos lista mov dificuldade
                clearScreen
                putStrLn (mostraNaTela novaLista 0 dificuldade "")
                putStrLn ("Número de jogadas: " ++ show (operacoes))

                if (novaLista /= lista) then    -- Movimento válido
                    executaOperacoes (executaMovimentos lista mov dificuldade) (dificuldade) (operacoes + 1)
                else                            -- Movimento inválido
                    executaOperacoes (executaMovimentos lista mov dificuldade) (dificuldade) (operacoes)


mostraNaTela :: [Int] -> Int -> Int -> String -> String
mostraNaTela (x:xs) contador dificuldade saida
    | (contador == (dificuldade^2)-1) = (saida++((exibe(x)(dificuldade))++"]\n"))
    | ((contador `mod` dificuldade) == 0) = mostraNaTela (xs) (contador+1) (dificuldade) (saida++("["++(exibe(x)(dificuldade))++","))
    | ((contador `mod` dificuldade) == dificuldade-1) = mostraNaTela (xs) (contador+1) (dificuldade) (saida++((exibe(x)(dificuldade))++"]\n")) 
    | otherwise = mostraNaTela (xs) (contador+1) (dificuldade) (saida++ ((exibe(x)(dificuldade))++",")) 


exibe :: Int -> Int -> String
exibe numero dificuldade
    | numero == dificuldade^2 = " "
    | otherwise = show(numero)

clearScreen :: IO ()
clearScreen = do
    SP.system "clear"
    return ()