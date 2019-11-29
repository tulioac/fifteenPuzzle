insereNoRanking(Pontuacao, ArrayBD, ArrayAtt):-
    writeln('Digite seu nome para salvar sua pontuacao'),
    read(R),
    atom_string(R, Nome),
    salvaPontuacao(Nome, Pontuacao, ArrayBD, ArrayAtt).
    
salvaPontuacao(Nome, Pontuacao, ArrayPersistencia, ArrayAtualizado):-
    append([[Nome,Pontuacao]], ArrayPersistencia, ArrayAtualizado).