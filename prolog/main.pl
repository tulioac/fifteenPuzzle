%:- initialization main.
:- include('lista.pl').

bemVindo :- writeln('Seja bem vindo ao Fifteen Puzzle - Versão Prolog!').

exibeDificuldades :- 
    writeln('Selecione a dificuldade desejada:'),
    writeln('1 - Fácil'),
    writeln('2 - Médio'),
    writeln('3 - Difícil'),
    writeln('4 - Impossível').

solicitaDificuldade(R) :- 
    read(R).

criaArrayOrdenado(Dificuldade, Lista) :-
    ValorFinal is (Dificuldade * Dificuldade),
    numlist(1, ValorFinal, Lista).

embaralhaArray(Array, ArrayEmbaralhado) :-
    random_permutation(Array, ArrayEmbaralhado).

verificaIgualdadeDeListas([], []).
verificaIgualdadeDeListas([H1 | R1], [H2 | R2]) :-
    H1 = H2,
    verificaIgualdadeDeListas(R1, R2).

% Verifica se a listas mudaram para acrescentar no contador
verificaMudanca(ListaEmbaralhada, NovaLista, Contador, NovoContador) :-
    (verificaIgualdadeDeListas(ListaEmbaralhada, NovaLista) -> NovoContador = Contador;
    NovoContador is Contador + 1).

jogo(Tamanho, Contador, ListaOrdenada, ListaEmbaralhada) :-
    writeln(ListaEmbaralhada), % Exibe array em formato de matriz
    write('Contador de movimentos: '),
    writeln(Contador),
    solicitaMovimento(Movimento),
    (Movimento = w -> moveCima(ListaEmbaralhada, Tamanho, NovaLista);
    Movimento = s -> moveBaixo(ListaEmbaralhada, Tamanho, NovaLista);
    Movimento = a -> moveEsquerda(ListaEmbaralhada, Tamanho, NovaLista);
    Movimento = d -> moveDireita(ListaEmbaralhada, Tamanho, NovaLista);
    writeln('Movimento invalido')),
    verificaMudanca(ListaEmbaralhada, NovaLista, Contador, NovoContador),
    (verificaIgualdadeDeListas(NovaLista, ListaEmbaralhada) ->
    writeln('Parabéns, você ganhou!');
    jogo(Tamanho, NovoContador, ListaOrdenada, NovaLista)).


main :- 
    bemVindo,
    exibeDificuldades,
    solicitaDificuldade(Dificuldade),
    Tamanho is Dificuldade + 2,
    criaArrayOrdenado(Tamanho, ListaOrdenada),
    embaralhaArray(ListaOrdenada, ListaEmbaralhada),
    Contador is 0,
    jogo(Tamanho, Contador, ListaOrdenada, ListaEmbaralhada),
    halt(0).

/* 

DONE: Mensagem de bem vindo  

DONE: Listar dificuldades
DONE: Solicitar dificuldade         FIXME: Validar entrada

DONE: Cria array de acordo com a dificuldade

DONE: Embarralha array

-- Execução do jogo
Exibe array embaralhado
Exibe contador

HELP: Solicita entrada (setas ou wasd)

Executa movimento de acordo com a entrada

DONE: Verifica ordenação            FIXME: Quando é true não exibe

EXTRA: Dicas de acordo com a quantidade de movimentos
EXTRA: Porcentagem de resolução
--

EXTRA: Implementar ranqueamento ao finalizar o jogo (salvar) - Persistência
        Solicitar o nome do jogador
        'Nome - Movimentos - 4x4'

EXTRA: Solicitar se quer jogar novamente e volta para início

*/
