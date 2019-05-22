%Resposta 3:
:- use_module(library(clpfd)).
:- use_module(library(lists)).

%3	
p3(L1,L2) :-
    length(L1,N),
    length(L2,N),
	maximum(Max,L1),
	minimum(Min,L1),
    domain(L2,Min,Max),
    pos(L1,L2,Is),
    all_distinct(Is),
    test(L2),
    labeling([],Is).
    
test([_,_]).
test([X1,X2,X3|Xs]) :-
    (
		(X1 #< X2 #/\ X2 #> X3) #\/
		(X1 #> X2 #/\ X2 #< X3)
	),
    test([X2,X3|Xs]).
	
pos([],_,[]).
pos([X|Xs],L2,[I|Is]) :-
    element(I,L2,X),
    pos(Xs,L2,Is).



%Resposta 4:
:- use_module(library(clpfd)).
:- use_module(library(lists)).
%4

receitas(NOvos,TempoMax,OvosPorReceita,TempoPorReceita,OvosUsados,Receitas):-
	length(OvosPorReceita,N),
	length(Res,N),
	domain(Res,0,1),%se faz ou nao a receita naquela posicao
	domain([OvosUsados],0,NOvos),
	
	applyRestrictions(Res,ChosenRecipes),
	getTimeAndEgg(ChosenRecipes,OvosPorReceita,TempoPorReceita,Tempo,OvosUsados),
	Tempo #=< TempoMax,
	sum(Res,#=,4),
	labeling([maximize(OvosUsados)],Res),
	traduzRes(Res,Receitas,1).
	
traduzRes([],[],_).
traduzRes([1 | ResT],[N | ReceitasT],N):-
	N1 is N + 1,
	traduzRes(ResT,ReceitasT,N1).

traduzRes([0 | ResT], ReceitasT,N):-
	N1 is N + 1,
	traduzRes(ResT,ReceitasT,N1).	
	

applyRestrictions([],[]).	
applyRestrictions([ReceitasH | ReceitasT],[HasRecipe| Next]):-
	ReceitasH #= 1 #<=> HasRecipe,
	applyRestrictions( ReceitasT,Next).
	
getTimeAndEgg(ChosenRecipes,OvosPorReceita,TempoPorReceita,Tempo,OvosUsados):-
		scalar_product(OvosPorReceita,ChosenRecipes,#=,OvosUsados),
		scalar_product(TempoPorReceita,ChosenRecipes,#=,Tempo).



%Resposta 5:
:- use_module(library(clpfd)).
:- use_module(library(lists)).

embrulha(Rolos,Presentes,RolosSelecionados):-
	length(Rolos,NRolos),
	length(Presentes,NPresentes),
	length(RolosSelecionados,NPresentes),
	domain(RolosSelecionados,1,NRolos),
	NewNRolos is NRolos + 1, 
	restrict(RolosSelecionados,Rolos,Presentes,1,NewNRolos),
	
	labeling([],RolosSelecionados).

restrict(_,_,_,Index,Index).
restrict(RolosSelecionados,Rolos,Presentes,Index,N):-
	getValueNList(RolosSelecionados,Index,List),
	nth1(Index,Rolos,MaxRole),
	scalar_product(Presentes,List,#=<, MaxRole),
	Index1 is Index + 1,
	restrict(RolosSelecionados,Rolos,Presentes,Index1,N).

getValueNList([],_,[]).
getValueNList([RolH | RolT],N,[Curr | Next]):-
	RolH #= N #<=> Curr,
	getValueNList(RolT,N,Next).