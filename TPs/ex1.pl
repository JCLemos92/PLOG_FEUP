list_member(X,[X|L]) :- !.
list_member(X,[Y|L]):- list_member(X,L).