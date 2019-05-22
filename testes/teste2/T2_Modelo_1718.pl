:-use_module(library(clpfd)).
:-use_module(library(lists)).



% Pergunta1

p1(L1,L2):-
    gen(L1,L2),
    test(L2).

gen([],[]).
gen(L1,[X|L2]) :-
    select(X,L1,L3),
    gen(L3,L2).

test([_,_]).
test([X1,X2,X3|Xs]) :-
    (X1 < X2, X2 > X3; X1 > X2, X2 < X3),
    test([X2,X3|Xs]).

% Resposta: 
% O programa apresentado é composto de dois predicados. O primeiro "gen/2" obriga a que as duas listas, tenham o mesmo tamanho 
% e os mesmos membros, sendo exatamente iguais. 
% O segundo predicado "test/1" sucede apenas se seguir uma das seguintes opcoes.
%   - Se um elemento(1) for menor que o seguinte(2) então o seguinte(2) tem de ser maior que o proximo elemento(3) se este existir.
%   - Se um elemento(1) for maior que o seguinte(2) então o seguinte(2) tem de ser menor que o proximo elemento(3) se este existir.
%
% Eficiencia:
% Este programa seria mais eficiente se fosse construido usando PLR. Uma vez que os valores que poderiam ser instanciados em L2
% seriam inferiores atraves da limitacao do seu dominio.
% E a programacao das restricoes  seria tambem  superior ao backtracking usado neste programa quando um dos valores nao e valido.



% Pergunta 2

% Resposta: 
% As variáveis de domínio estão a ser instanciadas antes da fase de pesquisa e nem todas as restrições foram colocadas antes da fase da pesquisa.
%
% Variaveis instanciadas: -Verdade porque ele vai instanciar o Is com o predicado pos/3, dai estar correcto.
% Restricoes: -Isto deve-se ao facto de fazer os teste test/1 depois do labeling, o que leva a fazer backtracking.



% Pergunta 3



p2(L1,L2):-
    length(L1,N),
    length(L2,N),
    %
    pos(L1,L2,Is),
   	all_distinct(Is),
   	testPLR(L2),
    labeling([],Is).

pos([],_,[]).
pos([X|Xs],L2,[I|Is]):-
	element(I,L2,X),
    %nth1(I,L2,X),
    pos(Xs,L2,Is).

testPLR([_,_]).
testPLR([X1,X2,X3|Xs]):-
 (X1 #< X2 #/\ X2 #> X3) #\/ (X1 #> X2 #/\ X2 #< X3),
 testPLR([X2,X3|Xs]).



 % Pergunta 4

sweet_recipes(MaxTime,NEggs,RecipeTimes,RecipeEggs,Cookings,Eggs):-
	length(RecipeTimes,M),

	length(Vars,M),
	domain(Vars,0,1),

	scalar_product(RecipeTimes,Vars, #=, ResCookings),
	scalar_product(RecipeEggs,Vars,  #=, Eggs),

	sum(Vars,#=,3),
	ResCookings #=< MaxTime,
	Eggs #=< NEggs,
	
	labeling(maximize(Eggs),Vars),

	traduzRes(Vars,Cookings,1).


traduzRes([],[],_).
traduzRes([1 | ResT],[N | ReceitasT],N):-
	N1 is N + 1,
	traduzRes(ResT,ReceitasT,N1).

traduzRes([0 | ResT], ReceitasT,N):-
	N1 is N + 1,
	traduzRes(ResT,ReceitasT,N1).



% Pergunta 5
%wrap(Presents,PaperRolls,SelectedPaperRolls):-
%    %variaveis de dominio e respetivos dominios
%    length(Presents, N),
%    length(SelectedPaperRolls, N),
%    length(PaperRolls, N1),
%    domain(SelectedPaperRolls, 1, N1),
% 
%    %restricao: assegurar que nenhum papel é utilizado em quantidade excessiva
%    getMachines(PaperRolls, 1, [], Machines),
%    getTasks(Presents, SelectedPaperRolls, [], Tasks),
%    write(Tasks), nl,
%    cumulatives(Tasks, Machines, [bound(upper)]),
% 
%    reset_timer,
%   labeling([], SelectedPaperRolls),
%    print_time,
%    fd_statistics.
 
%getMachines([], _, Machines, Machines).
%getMachines([Curr | Rem], Idx, Acc, Machines):-
%    append(Acc, [machine(Idx, Curr)], NewAcc),
%    NewIdx is Idx + 1,
%    getMachines(Rem, NewIdx, NewAcc, Machines).
 
%getTasks([], [], Tasks, Tasks).
%getTasks([CurrPresent | RemPresents], [CurrSelected | RemSelected], Acc, Tasks):-
%    append(Acc, [task(0, 1, 1, CurrPresent, CurrSelected)], NewAcc),
%    getTasks(RemPresents, RemSelected, NewAcc, Tasks).

wrap(Presents,PaperRolls,SelectedPaperRolls):-
	length(Presents,Npresentes),
	length(PaperRolls,NpaperRolls),
	length(SelectedPaperRolls,Npresentes),

	domain(SelectedPaperRolls,1,NpaperRolls),

	NewPaperRolls is NpaperRolls + 1,

	restrict(SelectedPaperRolls,PaperRolls,Presents,1,NewPaperRolls),

	labeling([],SelectedPaperRolls).

restrict(_,_,_,Index,Index).
restrict(SelectedPaperRolls,PaperRolls,Presents,Index,N):-
	getValueNList(SelectedPaperRolls,Index,List),
	nth1(Index,PaperRolls,MaxRoll),
	scalar_product(Presents,List,#=<, MaxRoll),
	Index1 is Index + 1,
	restrict(SelectedPaperRolls,PaperRolls,Presents,Index1,N).

getValueNList([],_,[]).
getValueNList([RolH | RolT],N,[Curr | Next]):-
	RolH #= N #<=> Curr,
	getValueNList(RolT,N,Next).