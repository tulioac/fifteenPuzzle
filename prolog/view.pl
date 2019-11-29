/*Exibe Lista na tela recebendo como parâmetro o tamanho da linha e o tamanho da lista*/
exibeNaTela([], TamanhoLinha, NumElementosArray) :- NumElementosArray =:= 0.

exibeNaTela([H|T], TamanhoLinha, NumElementosArray):-
    (NumElementosArray-1) mod TamanhoLinha =:= 0, H =:= TamanhoLinha**2, write('  '), writeln(' '), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2).

exibeNaTela([H|T], TamanhoLinha, NumElementosArray):-
    (H =:= TamanhoLinha**2 ->
        write('  '), write(' '), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2));
    ((NumElementosArray-1) mod (TamanhoLinha)) =:= 0 -> 
        (H < 10 -> write('0')),
        writeln(H), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2);
        

    (H < 10 -> write('0'),write(H),
        write(' '),
        X2 is NumElementosArray-1,
        exibeNaTela(T, TamanhoLinha,X2));

    write(H),
    write(' '),
    X2 is NumElementosArray-1,
    exibeNaTela(T, TamanhoLinha,X2).

exibeNaTela([H|T], TamanhoLinha, NumElementosArray):- (NumElementosArray-1) mod TamanhoLinha =:= 0,H =:= TamanhoLinha**2, writeln(H), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2)).
exibeNaTela([H|T], TamanhoLinha, NumElementosArray):- (NumElementosArray-1) mod TamanhoLinha =:= 0, (H >= 10 -> writeln(H), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2)).
exibeNaTela([H|T], TamanhoLinha, NumElementosArray):- (H >= 10 -> write(H), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2)).

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

exibeDicas :-
    limparTela,
    writeln('Dica 1 - Para preencher as primeiras fileiras, tente colocar os numeros de ordem crescente da esquerda para direita'),
    writeln('Dica 2 - Nas ultimas duas linhas, para preencher tente manter intercalados os numeros da penultima e ultima fileira'),
    nl.

limparTela :-
    nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl,nl, nl, nl, nl, nl, nl, nl.