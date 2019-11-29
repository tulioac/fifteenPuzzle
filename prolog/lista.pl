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

verificaIguais([], [], Contador, Contador).
verificaIguais([H|T1],[H|T2], Contador, Saida) :- 
    NewContador is Contador + 1, verificaIguais(T1,T2,NewContador, Saida).
verificaIguais([_|T1],[_|T2],Contador,Saida) :- verificaIguais(T1,T2,Contador,Saida).

imprimePorcentagem(ListaJogo, ListaOrdenada) :-
    verificaIguais(ListaJogo, ListaOrdenada, 0, R), 
    length(ListaJogo, TamanhoLista), 
    Porcentagem is (R/TamanhoLista)*100,
    write('Porcentagem completa: '),
    format('~0f%', Porcentagem),
    writeln('').
