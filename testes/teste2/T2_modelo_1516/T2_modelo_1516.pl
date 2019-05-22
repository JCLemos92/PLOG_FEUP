:-use_module(library(clpfd)).
:-use_module(library(lists)).

% Pergunta 1

p1(L1,L2):-
	gen(L1,L2),
	test(L2).

gen([],[]).
gen(L1,[X| L2]):-
	select(X,L1,L3),
	gen(L3,L2).

test([_,_]).
test([X1,X2,X3|Xs]):-
	(X1 < X2, X2 < X3; X1 > X2, X2 > X3),
	test(Xs).



% O programa apresentado verifica se L2 se trata de uma premutacao da lista L1 e se nao
% existem elementos seguidos com o mesmo valor, e se segue uma das seguintes condições:
%   -Se o elemento(1) da lista for menor que o seguinte(2), entao o proximo elemento(3)
%   tem de ser menor que o seguinte(2).
%   -Se o elemento(2) da lista for maior que o seguinte(2), entao o proximo elemento(3)
%   tem de ser maior que o seguinte.
%
% Em termos de eficiencia:
% O programa podia ser mais eficiente se fosse programado usando PLR, visto que os
% os valores que podem ser instanciados a L2 sao reduzidos pela delimitacao do seu 
% dominio. Para além disso, a programacao das restricoes seria tambem superior ao 
% backtrackding usado quando um desses valores nao e valido.



% Pergunta 2
% Resposta c) As variavies de dominio estao a ser instanciadas antes da fase de
%             de pesquisa e nem todas as restricoes foram  colocadas antes da
%			  fase de pesquisa.


% Pergunta 3
p3(L1,L2):-
	length(L1,N),
	length(L2,N),
	pos3(L1,L2,Is),
	all_distinct(Is),
	test3(L2),
	labeling([],Is).


pos3([],_,[]).
pos3([X | Xs],L2,[I | Is]):-
	element(I,L2,X),
	pos3(Xs,L2,Is).

test3([]).
test3([_]).
test3([_,_]).
test3([X1,X2,X3 | Xs]):-
	(
		(X1 #< X2 #/\ X2 #< X3)
		#\/
		(X1 #> X2 #/\ X2 #> X3)
	),
	test3(Xs).



% Pergunta 4
sweet_recipes(MaxTime, NEggs, RecipesTimes, RecipesEggs, Cookings, Eggs):-
	length(RecipesTimes,L),
	length(Vars,L),
	domain(Vars,0,1),

	scalar_product(RecipesTimes,Vars,#=,Time),
	scalar_product(RecipesEggs,Vars,#=,Eggs),
	sum(Vars,#=,3),

	Time #=< MaxTime,
	Eggs #=< NEggs,


	labeling(maximize(Eggs),Vars),
	getCookings(Vars,1,Cookings).

getCookings([],_,[]).
getCookings([1 | Rest],N,Cookings):-
	N1 is N + 1,
	getCookings(Rest,N1,NewCookings),
	Cookings = [N | NewCookings].

getCookings([0 | Rest],N,NewCookings):-
	N1 is N + 1,
	getCookings(Rest,N1,NewCookings).




% Pergunta 5
cut(Shelves,Boards,SelectedBoards):-
	length(Shelves,L),
	length(Boards,D),
	length(SelectedBoards,L),
	domain(SelectedBoards,1,D),

	N is D + 1,
	restrict(SelectedBoards,Shelves,Boards,1,N),

	labeling([],SelectedBoards).

restrict(_,_,_,Index,Index).
restrict(SelectedBoards,Shelves,Boards,Index,N):-
	getValueNList(SelectedBoards,Index,List),
	nth1(Index,Boards,Max),
	scalar_product(Shelves,List,#=<,Max),
	Index1 is Index + 1,
	restrict(SelectedBoards,Shelves,Boards,Index1,N).

getValueNList([],_,[]).
getValueNList([Board | Rest], N, [Curr | Next]):-
	Board #= N #<=> Curr,
	getValueNList(Rest, N, Next).






