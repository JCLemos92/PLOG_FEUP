:-use_module(library(clpfd)).
:-use_module(library(lists)).

attend(FilmList,Goings,Worth):-
	getWorths(FilmList,WorthList),
	length(FilmList,L),
	length(Goings,L),
	domain(Goings,0,1),

	create_Tasks(FilmList,Goings,Tasks),

	Machine1 =.. [machine,1,1],
	Machine2 =.. [machine,0,1000],

	cumulatives(Tasks,[Machine1,Machine2],[bound(upper)]),
	scalar_product(WorthList,Goings,#=,Worth),
	labeling(maximize(Worth),Goings).

create_Tasks([],[],[]).
create_Tasks([(S,D,_) | FilmList], [G | Goings], [Task | Tasks]):-
	Task =.. [task,S,D,_,1,G],
	create_Tasks(FilmList,Goings,Tasks).


getWorths([],[]).
getWorths([(_,_,W)|T],[W|Worths]):-
	getWorths(T,Worths).