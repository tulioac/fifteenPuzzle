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
    (Modulo \= 0 -> Posicao is IndiceEspacoVazio - 1,
    trocaElementos(Lista, IndiceEspacoVazio, Posicao, R);
    R = Lista).

moveDireita(Lista, Tamanho, R) :-
    ValorMaximo is Tamanho ** 2,
    pegaIndiceEspacoVazio(Lista, ValorMaximo, IndiceEspacoVazio),
    Modulo is (IndiceEspacoVazio mod Tamanho),
    Condicao is Tamanho - 1,
    (Modulo \= Condicao -> Posicao is IndiceEspacoVazio + 1,
    trocaElementos(Lista, IndiceEspacoVazio, Posicao, R);
    R = Lista).

moveCima(Lista, Tamanho, R) :-
    ValorMaximo is Tamanho ** 2,
    pegaIndiceEspacoVazio(Lista, ValorMaximo, IndiceEspacoVazio),
    (IndiceEspacoVazio >= Tamanho -> Posicao is IndiceEspacoVazio - Tamanho,
    trocaElementos(Lista, IndiceEspacoVazio, Posicao, R);
    R = Lista).

moveBaixo(Lista, Tamanho, R) :-
    ValorMaximo is Tamanho ** 2,
    pegaIndiceEspacoVazio(Lista, ValorMaximo, IndiceEspacoVazio),
    (IndiceEspacoVazio < Tamanho * (Tamanho - 1) -> Posicao is IndiceEspacoVazio + Tamanho,
    trocaElementos(Lista, IndiceEspacoVazio, Posicao, R);
    R = Lista).

solicitaMovimento(R) :-
    writeln('Digite o movimento desejado:'),
    writeln('(w.) Mover para cima'),
    writeln('(s.) Mover para baixo'),
    writeln('(e.) Mover para esquerda'),
    writeln('(d.) Mover para direita'),
    writeln('(t.) Caso deseje alguma dica'),

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