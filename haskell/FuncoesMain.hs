module FuncoesMain (
    exibeDificuldades,
    solicitaDificuldade    
) where

exibeDificuldades :: IO()
exibeDificuldades =
    putStrLn $ 
    ("1 - Easy") ++ "\n" ++ 
    ("2 - Medium") ++ "\n" ++
    ("3 - Hard") ++ "\n" ++
    ("4 - Very Hard") ++ "\n" ++
    ("5 - Ultimate")

solicitaDificuldade :: IO Int
solicitaDificuldade = do
    putStrLn ("Digite a dificuldade desejada")
    dificuldade <- getLine
    return (read (dificuldade))