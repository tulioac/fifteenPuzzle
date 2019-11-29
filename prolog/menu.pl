:- include('view.pl').

exibeMenu(OpcaoEscolhida):-
    exibeBemVindo,
    recebeOpcaoValida(OpcaoEscolhida).

recebeOpcaoValida(OpcaoEscolhida):-
    exibeOpcoes,
    writeln('Escolha uma opção: '),
    read(Opcao),
    (Opcao = i -> OpcaoEscolhida = 1);
    (Opcao = ii -> OpcaoEscolhida = 2);
    (Opcao = iii -> OpcaoEscolhida = 3);
    limparTela,OpcaoEscolhida = OpcaoInv, recebeOpcaoValida(OpcaoInv).

exibeBemVindo:-
    writeln('FIFTEEN PUZZLE!!!!!!!!!'),
    nl,nl,nl.

exibeOpcoes:- 
    writeln('Menu Inicial:'),
    writeln('i   - Jogar!'),
    writeln('ii  - Ranking').