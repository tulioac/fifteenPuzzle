import FuncoesMain
import Implementacao

executaJogo:: [Int] -> String -> [Int]
executaJogo lista movimento
--    |isSorted (lista) = "Ganhou"
    |movimento == "w" = (moveCima (lista))
    |movimento == "a" = (moveEsquerda (lista))
    |movimento == "s" = (moveBaixo (lista))
    |otherwise = (moveDireita (lista))
        
    
    
--Espera movimento
--Recebe movimento e chama funcão 'movimento' passando esse como parâmetro
