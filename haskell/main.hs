import FuncoesMain
import Jogo

main :: IO()
main = do 
    {- Exibe dificuldades -}
    exibeDificuldades
    {- Seleciona dificuldade -}
    dificuldade <- solicitaDificuldade

    {- Cria e preenche array de 1 até o tamanho desejado -}
    {- Embaralha array -}
    arrayEmbaralhado <- embaralhaArray (criaArrayOrdenado (dificuldade + 1))
    
    {-Exibe array embaralhado, em forma de Matriz Embaralhada-}
    putStrLn $ mostraNaTela (arrayEmbaralhado) (0) (dificuldade + 1) ("") 

    executaOperacoes arrayEmbaralhado (dificuldade + 1)

{- Jogo:
    - Exibe o contador de ações
    - Exibe a matriz
    
    - Aguarda a tecla de ação
    - Mover de acordo com a tecla
    - 0 para sair

    - Limpa tela (se possível)
-}

{- Verifica a matriz com um array ordenado -}