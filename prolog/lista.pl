trocaElementos(L, I, J, R) :-
    same_length(L, R),
    append(BeforeI, [AtI|PastI], L),
    append(BeforeI, [AtJ|PastI], Bs),
    append(BeforeJ, [AtJ|PastJ], Bs),
    append(BeforeJ, [AtI|PastJ], R),
    length(BeforeI, I),
    length(BeforeJ, J).

indiceDoElemento([Elemento|_], Elemento, 0) :- !.
indiceDoElemento([_|Cauda], Elemento, Indice) :-
    indiceDoElemento(Cauda, Elemento, Indice1),
    !,
    Indice is Indice1 + 1.

/*Valor is (Dificuldade + 2) ** 2,*/
pegaIndiceEspacoVazio(Lista, Dificuldade, Indice) :-
    indiceDoElemento(Lista, Dificuldade, Indice).

moveEsquerda(Lista, Tamanho, R) :-
    ValorMaximo is Tamanho ** 2,
    pegaIndiceEspacoVazio(Lista, ValorMaximo, IndiceEspacoVazio),
    Modulo is (IndiceEspacoVazio mod Tamanho),
    Modulo \= 0,
    Posicao is IndiceEspacoVazio - 1,
    trocaElementos(Lista, IndiceEspacoVazio, Posicao, R).

moveDireita(Lista, Tamanho, R) :-
    ValorMaximo is Tamanho ** 2,
    pegaIndiceEspacoVazio(Lista, ValorMaximo, IndiceEspacoVazio),
    Modulo is (IndiceEspacoVazio mod Tamanho),
    Condicao is Tamanho - 1,
    Modulo \= Condicao,
    Posicao is IndiceEspacoVazio + 1,
    trocaElementos(Lista, IndiceEspacoVazio, Posicao, R).

moveCima(Lista, Tamanho, R) :-
    ValorMaximo is Tamanho ** 2,
    pegaIndiceEspacoVazio(Lista, ValorMaximo, IndiceEspacoVazio),
    IndiceEspacoVazio >= Tamanho, 
    Posicao is IndiceEspacoVazio - Tamanho,
    trocaElementos(Lista, IndiceEspacoVazio, Posicao, R).

moveBaixo(Lista, Tamanho, R) :-
    ValorMaximo is Tamanho ** 2,
    pegaIndiceEspacoVazio(Lista, ValorMaximo, IndiceEspacoVazio),
    IndiceEspacoVazio < Tamanho * (Tamanho - 1), 
    Posicao is IndiceEspacoVazio + Tamanho,
    trocaElementos(Lista, IndiceEspacoVazio, Posicao, R).

exibeNaTela([], NumElementosArray) :- NumElementosArray =:= 0.
exibeNaTela([H|T], TamanhoLinha, NumElementosArray) :-
    ((NumElementosArray-1) mod (TamanhoLinha)) =:= 0 ->
        write(H), nl, X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2);
    write(H),
    write(" "),
    X2 is NumElementosArray-1,
    exibeNaTela(T, TamanhoLinha,X2).
