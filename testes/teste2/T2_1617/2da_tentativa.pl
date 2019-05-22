:- use_module(library(clpfd)).
:- use_module(library(lists)).

% Pergunta 1

% O programa retorna verdadeiro caso a lista L2 seja uma permutação da lista L1, se não
% tiver valores iguais que sejam seguidos. Para além disso a lista L2 tem de seguir uma
% das seguintes condições:
%   - Se um elemento(1) da lista for menor que o seguinte(2) entao o proximo elemento(3)
%     tem de ser menor que o seguinte(2).
%   - Se um elemento(1) da lista for maior que o seguinte(2) entao o proximo elemento(3)
%     tem de ser maior que o seguinte(2).
%
% Eficiencia:
% O programa seria mais eficiente se fosse programado usando PLR, visto que os valores
% que podiam ser instanciados em L2 seriam inferiores com a restrição do seu dominio. 
% Para além disso a utilização de restrições é mais eficiente que o backtracking quando
% um dos valores nao e valido.


% Pergunta 2 

% As vairaveis de dominio estao a ser instanciasdas antes da fase de pesquisa e nem
% Nem todas as restrições foram colocadas antes da fase de pesquisa.


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

test3([_,_]).
test3([X1,X2,X3 | Xs]):-
	(
		(X1 #< X2 #/\ X2 #> X3)
		#\/
		(X1 #> X2 #/\ X2 #< X3)
	),
	test3([X2,X3 | Xs]).




% Pergunta 4

receitas(NOvos,TempoMax,OvosPorReceita,TempoPorReceita,OvosUsados,Receitas):-
	length(OvosPorReceita,L),
	length(Vars,L),
	domain(Vars,0,1),

	sum(Vars,#=,4),
	scalar_product(OvosPorReceita,Vars,#=,OvosUsados),
	scalar_product(TempoPorReceita,Vars,#=,Tempo),

	Tempo #=< TempoMax,
	OvosUsados #=< NOvos,

	labeling(maximize(OvosUsados),Vars),
	getReceitas(Vars,1,Receitas).

getReceitas([],_,[]).
getReceitas([1 | Vars], Index, Receitas):-
	Index1 is Index + 1,
	Receitas = [Index | NewReceitas],
	getReceitas(Vars,Index1,NewReceitas).

getReceitas([0 | Vars], Index, Receitas):-
	Index1 is Index + 1,
	getReceitas(Vars,Index1,Receitas).



% Pergunta 5
embrulha(Rolos,Presentes,RolosSelecionados):-
	length(Presentes,L),
	length(RolosSelecionados,L),
	length(Rolos,R),
	domain(RolosSelecionados,1,R),

	N is R + 1,
	restrict(RolosSelecionados,Rolos,Presentes,1,N),

	labeling([],RolosSelecionados).


restrict(_,_,_,Index,Index).
restrict(RolosSelecionados,Rolos,Presentes,Index,N):-
	getValueNList(RolosSelecionados,Index,List),
	element(Index,Rolos,Max),
	scalar_product(Presentes,List,#=,LengthRolo),
	LengthRolo #=<	Max, 
	Index1 is Index + 1,
	restrict(RolosSelecionados,Rolos,Presentes,Index1,N).

getValueNList([],_,[]).
getValueNList([Rolo | RolosSelecionados], N, [Curr | Next]):-
	Rolo #= N #<=> Curr,
	getValueNList(RolosSelecionados,N,Next).



%---------------------------------------------------------------



embrulha1(Rolos, Presentes, Res) :-
    sum(Rolos, #=, CompRolos),
    sum(Presentes, #=, CompPresentes),
    CompRolos #>= CompPresentes,
    
    createTasks(Presentes, Tasks),
    createMachines(Rolos, Machines, 1),
    
    cumulatives(Tasks, Machines, [bound(upper)]),
    
    getTasksList(Tasks, TasksList),
    
    getTasks(Res, TasksList),

    labeling([], Res).

   
getTasksList([],[]).
getTasksList([H | T], [HL | TL]) :-
    H =.. HL,
    getTasksList(T,TL).
   
getTasks([],[]).
getTasks([R1 | R], [[_,_,_,_,_,T1] | T]) :-
    R1 #= T1,
    getTasks(R,T).
   
createTasks([], []).
createTasks([Presente1 | Presentes], [Task | Tasks]) :-
    Task =.. [task,0,1,1, Presente1, _],
    createTasks(Presentes, Tasks).
   
createMachines([], [], _).
createMachines([Rolo1| Rolos], [Machine | Machines] , ID) :-
    Machine =.. [machine,ID, Rolo1],
    NewID is ID + 1,
    createMachines(Rolos, Machines, NewID).