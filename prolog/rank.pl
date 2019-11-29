insereNoRanking(Pontuacao, [], ArrayAtt):-
    read(R),
    atom_string(R, Nome),
    salvaPontuacao(Nome, Pontuacao, ArrayBD, ArrayAtt).

insereNoRanking(Pontuacao, ArrayBD, ArrayAtt):-
    read(R),
    atom_string(R, Nome),
    salvaPontuacao(Nome, Pontuacao, ArrayBD, ArrayAtt).
    
salvaPontuacao(Nome, Pontuacao, ArrayPersistencia, ArrayAtualizado):-
    append([[Nome,Pontuacao]], ArrayPersistencia, ArrayAtualizado).