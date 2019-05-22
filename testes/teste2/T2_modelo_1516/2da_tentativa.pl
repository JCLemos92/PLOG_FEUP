:-use_module(library(clpfd)).
:-use_module(library(lists)).

% Pergunta 1

p1(L1,L2):-
	gen(L1,L2),
	test(L2).

gen([],[]).
gen(L1,[X | L2]):-
	select(X,L1,L3),
	gen(L3,L2).

test([]).
test([_]).
test([X1,X2,X3 | Xs]):-
	(X1 < X2, X2 < X3; X1 > X2, X2 > X3),
	test(Xs).

% Este programa verifica se a list L2 é uma premutacao da lista L1 e sem valores
% valores repetidos seguidos. Para alem disso verifica se a lista L2 segue uma das
% seguintes condicoes:
%   - A lista é uma ordenacao crescente de valores
%   - A lista é uma ordenacao decrescente de valores

% Em termos de eficiencia:
% O programa podia ser mais eficiente se fosse implementado com PLR, visto que os 
% valores que podiam ser instanciados na lista L2 seriam menores com a restrição do 
% seu dominio. Para além disso a implementacao de restricoes seria superior/melhor em 
% relacao ao backtracking que acontece quando um dos valores da lista L2 nao segue as 
% regras.


%Pergunta 2

% As variaveis de dominio estao a ser instanciadas antes da fase de pesquisa e nem todas
% as restricoes foram colocadas antes da fase de pesquisa.


% Pergunta 3

p3(L1,L2):-
	length(L1,N),
	length(L2,N),
	pos3(L1,L2,Is),
	all_distinct(Is),
	test3(L2),
	labeling([],Is).

pos3([],_,[]).
pos3([X | Xs], L2, [I | Is]):-
	element(I,L2,X),
	pos3(Xs,L2,Is).

test3([]).
test3([_]).
test3([X1,X2,X3 | Xs]):-
	( 
		(X1 #< X2 #/\ X2 #< X3)
		#\/ 
		(X1 #> X2 #/\ X2 #> X3)
	),
	test(Xs).

% Pergunta 4
sweet_recipes(MaxTime, NEggs, RecipeTimes, RecipeEggs, Cookings, Eggs):-
	length(RecipeTimes,L),
	length(Vars,L),
	domain(Vars,0,1),

	sum(Vars,#=,3),
	scalar_product(RecipeTimes,Vars, #=, Time),
	scalar_product(RecipeEggs, Vars, #=, Eggs),
	

	Time #=< MaxTime,
	Eggs #=< NEggs,

	labeling(maximize(Eggs),Vars),
	getCookings(Vars,1,Cookings).

getCookings([],_,[]).
getCookings([1 | Vars], I, Cookings):-
	I1 is I + 1,
	Cookings = [I | NewCookings],
	getCookings(Vars, I1, NewCookings).

getCookings([0 | Vars], I, Cookings):-
	I1 is I + 1,
	Cookings = NewCookings,
	getCookings(Vars,I1,NewCookings).



% Pergunta 5

cut(Shelves, Boards, SelectedBoards):-
	length(Shelves,L),
	length(SelectedBoards,L),
	length(Boards,B),
	domain(SelectedBoards,1,B),
	
	

	N is B + 1,
	restrict(SelectedBoards,Shelves,Boards,1,N),
	labeling([],SelectedBoards).

restrict(_,_,_,Index,Index).
restrict(SelectedBoards,Shelves,Boards,Index,N):-
	getValueNList(SelectedBoards,Index,List),
	element(Index,Boards,MaxLength),
	scalar_product(Shelves, List, #=, Length),	
	Length #=< MaxLength,
	Index1 is Index + 1,
	restrict(SelectedBoards,Shelves,Boards,Index1,N).

getValueNList([],_,[]).
getValueNList([Board | Rest], N, [Curr | Next]):-
	Board #= N #<=> Curr,
	getValueNList(Rest,N,Next).


% Pergunta 5 com cumulatives (Nao funciona)
cut2(Shelves, Boards, SelectedBoards):-
	length(Shelves,L),
	length(SelectedBoards,L),
	length(Boards,B),
	domain(SelectedBoards,1,B),

	create_Tasks(SelectedBoards,Tasks),
	createMachines(Boards,Machines,1),

	cumulatives(Tasks, Machines, [bound(upper)]),

	labeling([],SelectedBoards).


create_Tasks([],[]).
create_Tasks([ Selected| SelectedBoards], [Task | Tasks]):-
	Task =.. [task,0,1,1,Selected,_],
	create_Tasks(SelectedBoards,Tasks).

createMachines([], [], _).
createMachines([Rolo1| Rolos], [Machine | Machines] , ID) :-
    Machine =.. [machine,ID, Rolo1],
    NewID is ID + 1,
    createMachines(Rolos, Machines, NewID).