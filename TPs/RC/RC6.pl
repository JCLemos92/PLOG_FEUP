animal(tweety, passaro).
animal(goldie, peixe).
animal(molie, minhoca).
animal(silvester, gato).

gostam_de(passaro, minhoca).
gostam_de(gato, peixe).
gostam_de(gato, passaro).
gostam_de(X, Y):- amigo(X,Y).
gostam_de(Y, X):- amigo(X,Y).

amigo(eu, gato).

come(gato,X):-
    gostam_de(gato,X).

a:- findall(X,come(gato,X),X),
    write('O gato come: '),
    write(X).

%b esta resposta apesar de não ser rasoável vem da passagem direta do texto apresentado para prolog.