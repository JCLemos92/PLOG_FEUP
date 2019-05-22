:-use_module(library(clpfd)).
:-use_module(library(lists)).

objecto(piano, 3, 30).
objecto(cadeira, 1, 10).
objecto(cama, 3, 15).
objecto(mesa, 2, 15).
homens(4).
tempo_max(60).

docente(pedro, m, 3, 6).
docente(joana, f, 3, 4).
docente(carla, f, 2, 5).
docente(mauro, m, 2, 4).
docente(david, m, 3, 4).
docente(maria, f, 1, 6).

mudancas:-
	homens(NHomens),
	findall(Obj-Men-Time,objecto(Obj,Men,Time),Objectos),
	tempo_max(Limite),
	length(Objectos,L),
	length(Start,L),
	length(End,L),
	domain(Start,0,Limite),
	domain(End,0,Limite),

	create_Tasks(Objectos,Start,End,Tasks,1),
	write(Tasks), nl,

	cumulative(Tasks, [limit(NHomens)]),

	append(Starts, Ends, Vars),
	labeling([], Vars),
	output(Objectos, Starts, Ends).

create_Tasks([], [], [], [], _).
create_Tasks([_-Men-Time | Objectos], [S | Starts], [E | Ends], Tasks, Index):-
	Index1 is Index + 1,
	create_Tasks(Objectos, Starts, Ends, Aux, Index1),
	append(Aux,[task(S,Time,E,Men,Index)], Tasks).
	

output([], [], []).
output([Obj-Men-_ | Rem1], [S | Rem2], [E | Rem3]):-
    write('Mover '),write(Obj),write(' ('),write(Men),write(' homens) desde t='),write(S),write(' ate t='),write(E),nl,
    output(Rem1, Rem2, Rem3).
	append(Aux,[task,S,Time,E,Men,Index], Tasks).


attend(FilmList,Goings,Worth):-
	getWorths(FilmList,WorthList),
	length(FilmList,L),
	length(Goings,L),
	domain(Goings,0,1),

	create_Tasks(FilmList,Goings,Tasks),
	Machine1 =.. [machine,1,1],
	Machine2 =.. [machine,0,1000],

	scalar_product(WorthList,Goings,#=,Worth),
	cumulatives(Tasks,[Machine1,Machine2],[bound(upper)]),
	labeling(maximize(Worth),Goings).

create_Tasks([],[],[]).
create_Tasks([(S,D,_)| FilmList], [G | Goings], [Task | Tasks]):-
	Task =.. [task,S,D,_,1,G],
	create_Tasks(FilmList,Goings,Tasks).

getWorths([],[]).
getWorths([(_,_,W)|T],[W|Worths]):-
	getWorths(T,Worths).




getDocentes(Docentes):-
	findall([Nome,Sexo,Incio,Fim],docente(Nome,Sexo,Incio,Fim),Docentes).

aulas(Aulas):-
	getDocentes(Docentes),
	
	create_Tasks(Docentes,Tasks,StarTimes),
	
	getGenderFlags(Docentes, Flags),
	selectElemFromList(StartTimes, Flags, WomenStartTimes),

	sum(WomenStartTimes,#=,WomanTotal),

	cumulative(Tasks,[limit(1)]),
	
	labeling(minimize(WomanTotal), [WomanTotal | StarTimes]),
	getPair_Prof_StartTime(Docentes, StartTimes, Aulas).

getPair_Prof_StartTime([],[],[]).
getPair_Prof_StartTime([[Nome,_,_,_] | Docentes], [StartTime | S], [Nome-StartTime |Aulas]):-
	getPair_Prof_StartTime(Docentes,S,Aulas).

selectElemFromList([],[],[]).
selectElemFromList([Elem | Rest], [1 | Flags], [Elem | Result]):-
	selectElemFromList(Rest,Flags,Result).

selectElemFromList([_ | Rest], [0 | Flags], Result):-
	selectElemFromList(Rest,Flags,Result).


getGenderFlags([],[]).
getGenderFlags([[_,m,_,_] | Docentes] ,[0 | Gs]):-
	getGenderFlags(Docentes,Gs).

getGenderFlags([[_,f,_,_] | Docentes] ,[1 | Gs]):-
	getGenderFlags(Docentes,Gs).


create_Tasks([],[],[]).
create_Tasks([Docente | Docentes],[Task | Tasks],[S | Starts]):-
	nth1(3,Docente,Smin),
	nth1(4,Docente,Smax),

	S in Smin.. Smax,
	
	Task = task(S,1,_,1,0),
	create_Tasks(Docentes,Tasks,Starts).