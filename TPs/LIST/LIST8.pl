:-use_module(library(lists)).

conta(Lista,N):-
    length(Lista,N).

a([],0).
a(L,N):-
    conta(L,N,0).
conta([H|T],N,I):-
    Next_I is I+1,
    conta(T,N,Next_I).
conta(_,N,I):- N is I.

%conta_elem(X,Lista,N).
counta_elem(_, [], 0).
counta_elem(X, [X | T], N) :-
  !, counta_elem(X, T, N1),
  N is N1 + 1.
counta_elem(X, [_ | T], N) :-
  counta_elem(X, T, N).
