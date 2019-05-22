%   S E N D
% + M O R E
% _________
% M O N E Y

:-use_module(library(clpfd)).

puzzle(Vars):-
    Vars=[S,E,N,D,M,O,R,Y],
    domain(Vars,0,9), 
    all_distinct(Vars),
    1000*S + 100*E + 10*N + D +
    1000*M + 100*O + 10*R + E #=
    10000*M + 1000*O + 100*N + 10*E + Y,
    labeling([],Vars).
