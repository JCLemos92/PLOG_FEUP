substitui(X,X,L1,L1).
substitui(X,Y,[H1|T1],L2):-
    H1==X,
    append(L2,Y,NL2),
    substitui(X,Y,T1,NL2).
substitui(X,Y,[H1|T1],L2):-
    append(L2,H1,NL2),
    substitui(X,Y,T1,NL2).
substitui(_,_,_,_).

