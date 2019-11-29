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

solicitaMovimento(R) :-
    writeln('Digite o movimento desejado w / a / s / d'),
    read(R).

/* 
solicitaMovimento(R) :-
    writeln('Digite o movimento desejado w / a / s / d'),
    read(R),
    validaMovimento(R).

validaMovimento(w). 
validaMovimento(a).
validaMovimento(s).
validaMovimento(d).
validaMovimento(R) :- 
    writeln('Movimento invalido, tente novamente.'),
    solicitaMovimento(R).
 */


exibeNaTela([], NumElementosArray) :- NumElementosArray =:= 0.
exibeNaTela([H|T], TamanhoLinha, NumElementosArray) :-
    ((NumElementosArray-1) mod (TamanhoLinha)) =:= 0 ->
        write(H), nl, X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2);
    write(H),
    write(" "),
    X2 is NumElementosArray-1,
    exibeNaTela(T, TamanhoLinha,X2).
    
    
    /*Exibe Lista na tela recebendo como parâmetro o tamanho da linha e o tamanho da lista*/
exibeNaTela([], TamanhoLinha, NumElementosArray) :- NumElementosArray =:= 0.
exibeNaTela([H|T], TamanhoLinha, NumElementosArray):-
    (H =:= TamanhoLinha**2 ->
        write("X"), write(" "), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2));
    ((NumElementosArray-1) mod (TamanhoLinha)) =:= 0 -> 
        (H < 10 -> write("0")),
        writeln(H), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2);

    (H < 10 -> write("0"),write(H),
        write(" "),
        X2 is NumElementosArray-1,
        exibeNaTela(T, TamanhoLinha,X2));

    write(H),
    write(" "),
    X2 is NumElementosArray-1,
    exibeNaTela(T, TamanhoLinha,X2).

/*Encapsula exibição de Lista na tela*/
exibeArray([]).
exibeArray(A):- 
    length(A, TamanhoLista),
    exibeNaTela(A,TamanhoLista/integer(sqrt(TamanhoLista)),
    TamanhoLista).

/*Acha elemento pelo indice*/

indiceDoElemento([Elemento|_], Elemento, 0) :- !.
indiceDoElemento([_|Cauda], Elemento, Indice) :-
    indiceDoElemento(Cauda, Elemento, Indice1),
    !,
    Indice is Indice1 + 1.

/*Apagar valor específico*/