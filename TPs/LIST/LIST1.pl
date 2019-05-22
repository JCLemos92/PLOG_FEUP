:-use_module(library(lists)).

a:- [a|[b,c,d]] = [a,b,c,d].

%b:- [a|b,c,d] = [a,b,c,d]. no, até dá erro a compilar

c(H,T):-[H|T] = [apple, broccoli, refrigerator]. 

d(H,T):- [H|T] = [a, b, c, d, e]. 

e(H,T):- [H|T] = [apples, bananas].

f(H,T):- [H|T] = [a, [b,c,d]]. 

g(H,T):- [H|T] = [apples].

h(H,T):- [H|T] = [].

i(One,Two,T):- [One, Two | T] = [apple, sprouts, fridge, milk].

j(X,Y,T,Z):- [X,Y|T] = [a|Z].

k(H,T,Z):- [H|T] = [apple, Z].

l:- [a|[b|[c|[d|[]]]]] = [a,b,c,d]. 