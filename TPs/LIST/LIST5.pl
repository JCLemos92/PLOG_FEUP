a(X,L):-
    member2(X,L).

member2(X,[Y|T]):-
    X = Y;
    member2(X,T).

b(X,L):- append(_, [X|_], L).

c(L,X):- append(_,[X],L).

nth_membro(1,[M|_],M). 
nth_membro(N,[_|T],M):-
    N>1,
    N1 is N-1,
    nth_membro(N1,T,M). 

