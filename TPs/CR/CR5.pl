:-use_module(library(between)).


e_primo(2).
e_primo(3).
e_primo(P) :- 
    integer(P), 
    P > 3, 
    P mod 2 =\= 0, 
    \+tem_factor(P,3).
tem_factor(N,L) :- 
    N mod L =:= 0.
tem_factor(N,L) :- 
    L * L < N, 
    L2 is L + 2, 
    tem_factor(N,L2).

%___________________________
%           ou
%___________________________

isPrime(A) :-
    \+(
        (A1 is A-1,
        between(2,A1,N), 
        0 is mod(A,N))
        ),
    \+(A is 1).