%Task   Duration    Resources
%T1     16          2
%T2     6           9
%T3     13          3
%T4     7           7
%T5     5           10
%T6     16          1
%T7     4           11

%Cap. máxima: 13

:-use_module(library(clpfd)).
:-use_module(library(lists)).

schedule(Ss, End):-
    Ss=[S1,S2,S3,S4,S5,S6,S7],
    Es=[E1,E2,E3,E4,E5,E6,E7],
    Task=[
        task(S1,16,E1,2,1),
        task(S2,6,E2,9,2),
        ...
    ],
    domain(Ss,1,50), domain(Es,1,100),
    domain([End],1,100),maximum(End,Es),
    cumutative(Tasks,[limit(13)]),
    append(Ss,[End],Vars),
    labeling([minimize(End)], Vars).
    
