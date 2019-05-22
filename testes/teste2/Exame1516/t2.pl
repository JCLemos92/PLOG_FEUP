:-use_module(library(clpfd)).
:-use_module(library(lists)).


concelho(x,120,410).
concelho(y,10,800).
concelho(z,543,2387).
concelho(w,3,38).
concelho(k,234,376).

concelhos(NDias, MaxDist, ConselhosVisitados, DistTotal, TotalEleitores):-
	findall(N, concelho(N,_,_), Nomes),
	findall(D, concelho(_,D,_), Distancias),
	findall(N, concelho(_,_,N), NEleitores),
	
	length(Nomes,L),
	
	length(Vars,L),
	domain(Vars,0,1),

	scalar_product(Distancias,Vars,#=,DistTotal),
	scalar_product(NEleitores,Vars,#=,TotalEleitores),
	sum(Vars,#=<,NDias),

	DistTotal #=< MaxDist,
	labeling(maximize(TotalEleitores),Vars),
	getConcelhos(Vars,Nomes,ConselhosVisitados).

getConcelhos([],[],[]).
getConcelhos([1 | Rest ], [Nome | Resto], ConselhosVisitados):-
	getConcelhos(Rest,Resto,NewConselhosVisitados),
	ConselhosVisitados = [Nome | NewConselhosVisitados].

getConcelhos([0 | Rest ], [_ | Resto], NewConselhosVisitados):-
	getConcelhos(Rest,Resto,NewConselhosVisitados).



%com cumulatives
concelhos1(NDias, MaxDist, ConselhosVisitados, DistTotal, TotalEleitores):-
	findall(N, concelho(N,_,_), Nomes),
	findall(D, concelho(_,D,_), Distancias),
	findall(N, concelho(_,_,N), NEleitores),
	length(Nomes,L),
	length(Start,L),
	length(End,L),
	
	length(Vars,L),
	domain(Vars,0,1),
	domain(Start,1,L),
	domain(End,1,L),

	create_Tasks(Vars, Tasks, Start, End),
	Machine1 =.. [machine,1,1],
	Machine2 =.. [machine,0,1000],
	
	cumulatives(Tasks,[Machine1,Machine2],[bound(upper)]),

	scalar_product(Distancias,Vars,#=,DistTotal),
	scalar_product(NEleitores,Vars,#=,TotalEleitores),
	sum(Vars,#=<,NDias),
	DistTotal #=< MaxDist,

	labeling(maximize(TotalEleitores),Vars),
	getConcelhos(Vars,Nomes,ConselhosVisitados).

create_Tasks([],[],[],[]).
create_Tasks([Var | Vars], [Task | Tasks], [S | Start], [E | End]):-
	Task =.. [task,S,1,E,1,Var],
	create_Tasks(Vars,Tasks,Start,End).