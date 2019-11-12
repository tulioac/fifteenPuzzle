import FuncoesIO
import System.IO
import Arrays

main :: IO()
main = do 
    
    clearScreen
    putStrLn $ "Bem vindo ao Fifteen Puzzle Game\n\n"

    {- Exibe dificuldades -}
    exibeDificuldades
    {- Seleciona dificuldade -}
    dificuldade <- solicitaDificuldade

    {- Cria e preenche array de 1 até o tamanho desejado -}
    {- Embaralha array -}
    arrayEmbaralhado <- embaralhaArray (criaArrayOrdenado (dificuldade + 1))

    clearScreen
    
    {-Exibe array embaralhado, em forma de Matriz Embaralhada-}
    putStrLn $ mostraNaTela (arrayEmbaralhado) (0) (dificuldade + 1) ("") 

    executaOperacoes arrayEmbaralhado (dificuldade + 1) 1

    hSetEcho stdout True
    hSetBuffering stdin LineBuffering

    putStrLn $ "Deseja jogar novamente? (s/n)"

    resposta <- getLine

    if (resposta == "s") then
        do
            clearScreen
            main
    else 
        return ()