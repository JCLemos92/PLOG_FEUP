:-use_module(library(clpfd)).
:-use_module(library(lists)).

% Pergunta 3

p2(L1,L2):-
    length(L1,N),
    length(L2,N),
    
    pos(L1,L2,Is),
    all_distinct(Is),
    test(L2),
    labeling([],Is).

pos([],_,[]).
pos([X|Xs],L2,[I|Is]):-
    element(I,L2,X),
    pos(Xs,L2,Is).

test([_,_]).
test([X1,X2,X3|Xs]) :-
    (
        (X1 #< X2 #/\ X2 #< X3)
         #\/ 
        (X1 #> X2 #/\ X2 #> X3)
    ),
    test([X2,X3|Xs]).


% Pergunta 4
constroi(NEmb,Orcamento,EmbPorObjeto,CustoPorObjeto,EmbUsadas,Objetos):-
    length(EmbPorObjeto,L),
    length(Vars,L),
    domain(Vars,0,1),

    scalar_product(EmbPorObjeto,Vars,#=,EmbUsadas),
    scalar_product(CustoPorObjeto,Vars,#=,Custo),

    EmbUsadas #=< NEmb,
    Custo #=< Orcamento,
    sum(Vars,#=,4),
    
    labeling(maximize(EmbUsadas),Vars),
    getObjectos(Vars,1,Objetos).

getObjectos([],6,[]).
getObjectos([1 | Rest],N,Objetos):-
    N1 is N + 1,
    getObjectos(Rest,N1,NewObjetos),
    Objetos = [N | NewObjetos].

getObjectos([0 | Rest],N,NewObjetos):-
    N1 is N + 1,
    getObjectos(Rest,N1,NewObjetos).

% Pergunta 5
wrap(Presents,PaperRolls,SelectedPaperRolls):-
    length(Presents,L),
    length(SelectedPaperRolls,L),

    length(PaperRolls,P),
    domain(SelectedPaperRolls,1,P),

    N1 is P +1,
    restrict(SelectedPaperRolls,PaperRolls,Presents,1,N1),

    labeling([],SelectedPaperRolls).

restrict(_,_,_,Index,Index).
restrict(SelectedPaperRolls,PaperRolls,Presents,Index,N):-
    getValueNList(SelectedPaperRolls,Index,List),
    nth1(Index,PaperRolls,MaxRoll),
    scalar_product(Presents,List,#=<,MaxRoll),
    N1 is Index + 1,
    restrict(SelectedPaperRolls,PaperRolls,Presents,N1,N).

getValueNList([],_,[]).
getValueNList([Roll | Rest],N,[Curr | Next]):-
    Roll #= N #<=> Curr,
    getValueNList(Rest,N,Next).

