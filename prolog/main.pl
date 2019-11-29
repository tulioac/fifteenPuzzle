%:- initialization main.
:- include('lista.pl').
:- include('view.pl').
:- include('menu.pl').
:- include('rank.pl').

bemVindo :- writeln('Seja bem vindo ao Fifteen Puzzle - Versão Prolog!').

exibeDificuldades :- 
    writeln('Selecione a dificuldade desejada, De 1 a 4:'),
    writeln('1 - Facil'),
    writeln('2 - Medio'),
    writeln('3 - Dificil'),
    writeln('4 - Impossivel').

solicitaDificuldade(R) :- 
    read(R),
    (R < 0 ->
        writeln('Opcao Invalida! Tente novamente.'),
        main;
        R > 4 -> 
        writeln('Opcao Invalida! Tente novamente.'),
        main;
    write('')).

ranking([[nome, 0]]).

appendRanking(Lista, Elem, [Elem|Lista]).
setRanking(Elem) :- 
    retract(ranking(X)),
    appendRanking(X, Elem, Saida),
    assert(ranking(Saida)).

:- dynamic ranking/1.

criaArrayOrdenado(Dificuldade, Lista) :-
    ValorFinal is (Dificuldade + 2) ** 2, 
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
    exibeArray(ListaEmbaralhada),
    write('Contador de movimentos: '),
    writeln(Contador),
    imprimePorcentagem(ListaEmbaralhada, ListaOrdenada),
    solicitaMovimento(Movimento),
    (Movimento = s -> limparTela, moveCima(ListaEmbaralhada, Tamanho, NovaLista);
    Movimento = w -> limparTela, moveBaixo(ListaEmbaralhada, Tamanho, NovaLista);
    Movimento = d -> limparTela, moveEsquerda(ListaEmbaralhada, Tamanho, NovaLista);
    Movimento = a -> limparTela, moveDireita(ListaEmbaralhada, Tamanho, NovaLista);
    Movimento = t -> limparTela, exibeDicas;
    Movimento = cheat -> Dificuldade is Tamanho-2, criaArrayOrdenado(Dificuldade, NovaLista);
    writeln('Movimento invalido')),
    verificaMudanca(ListaEmbaralhada, NovaLista, Contador, NovoContador),
    (verificaIgualdadeDeListas(NovaLista, ListaOrdenada) ->
    writeln('Parabens, voce ganhou!'),
    writeln('Digite seu nome:'),
    read(Nome),
    setRanking([Nome, Contador]), ranking(X),
    main;
    jogo(Tamanho, NovoContador, ListaOrdenada, NovaLista)).

main:- 
    limparTela,
    exibeMenu(Opcao),
    (Opcao =:= 1 -> 
        exibeDificuldades,
        solicitaDificuldade(Dificuldade), limparTela,
        criaArrayOrdenado(Dificuldade, ListaOrdenada),
        Tamanho is Dificuldade + 2,
        embaralhaArray(ListaOrdenada, ListaEmbaralhada),
        Contador is 0,
        jogo(Tamanho, Contador, ListaOrdenada, ListaEmbaralhada);
    Opcao =:= 2 -> ordenaRanking(RankingOrdenado),writeln('RANKING'), imprimeRanking(RankingOrdenado)),
    halt(0).

ordenaRanking(ListaOrdenada) :-
    ranking(Lista),
    sort(2, @<, Lista, ListaOrdenada).

imprimeRanking([]):- nl,nl,writeln('Digite menu. para exibir o menu: '),read(X), main.
imprimeRanking([[Nome,Contador]|T]):-
    write(Nome), write('..........'),
    Pontuacao is Contador*10,writeln(Pontuacao),
    imprimeRanking(T).
