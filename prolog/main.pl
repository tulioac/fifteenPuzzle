:- initialization main.

bemVindo :- writeln("Seja bem vindo ao Fifteen Puzzle - Versão Prolog!").

exibeDificuldades :- 
        writeln("Selecione a dificuldade desejada:"),
        writeln("1 - Fácil"),
        writeln("2 - Médio"),
        writeln("3 - Difícil"),
        writeln("4 - Impossível").

solicitaDificuldade(R) :- 
        read(R).

criaArrayOrdenado(Dificuldade, Lista) :-
        ValorFinal is (Dificuldade * Dificuldade),
        numlist(1, ValorFinal, Lista).

main :- 
        bemVindo,
        exibeDificuldades,
        solicitaDificuldade(Dificuldade),
        writeln(Dificuldade),
        criaArrayOrdenado(Dificuldade, Lista),
        writeln(Lista),
        halt(0).


/* 

Mensagem de bem vindo  

Listar dificuldades
Solicitar dificuldade

Cria array de acordo com a dificuldade

Embarralha array

-- Execução do jogo
Exibe array embaralhado
Exibe contador

FIXME: Solicita entrada (setas ou wasd)

Executa movimento de acordo com a entrada

Verifica ordenação

TODO: Dicas de acordo com a quantidade de movimentos
TODO: Porcentagem de resolução
--

TODO: Implementar ranqueamento ao finalizar o jogo (salvar) - Persistência
        Solicitar o nome do jogador
        "Nome - Movimentos - 4x4"

TODO: Solicitar se quer jogar novamente e volta para início

*/
