:-use_module(library(clpfd)).
:-use_module(library(lists)).


% Pergunta 4
% Uma opcao:

attend(FilmList,Goings,Worth):-
	treatInfo(FilmList,Hours,Durs,Worths),
	length(FilmList,L),
	length(Goings,L),
	domain(Goings,0,1),

	getSeeing(Hours,Durs,Goings),
	scalar_product(Worths,Goings,#=,Worth),
	labeling([maximize(Worth),down],Goings).

getSeeing([_],[_],[_]).
getSeeing([H1,H2 | T1], [D1,D2| T2], [Curr | Next]):-
	Duration is H1 + D1,
	Curr #= (H1 #\= H2) #<=> (Duration #=< H2),
	getSeeing([H2|T1],[D2|T2], Next).


treatInfo([],[],[],[]).
treatInfo([(Hour, Dur, Worth)| T], Hours,Durs,Worths):-
	treatInfo(T,NewHours,NewDurs,NewWorths),
	Hours = [Hour | NewHours],
	Durs = [Dur | NewDurs],
	Worths = [Worth | NewWorths].


% Pergunta 4
% outra alternativa:

attend1(FilmList,Goings,Worth):-
	length(FilmList,L),
	length(Goings,L),
	domain(Goings,0,1),
	getWorths(FilmList,WorthList),
	scalar_product(WorthList,Goings,#=,Worth),
	create_Tasks(FilmList, Goings,Tasks),
	Machine1 =.. [machine,1,1],
	Machine2 =.. [machine,0,1000],
	cumulatives(Tasks, [Machine1,Machine2], [bound(upper)]),
	labeling([maximize(Worth)], Goings).

getWorths([],[]).
getWorths([(_,_,W)|T],[W|Worths]):-
	getWorths(T,Worths).


create_Tasks([],[],[]).
create_Tasks([(S,D,_) | FilmList], [G | Goings], [Task | Tasks]):-
	Task = task(S,D,_,1,G),
	create_Tasks(FilmList,Goings,Tasks).





