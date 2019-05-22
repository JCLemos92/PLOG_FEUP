:-use_module(library(clpfd)).

objecto(piano, 3, 30).
objecto(cadeira, 1, 10).
objecto(cama, 3, 15).
objecto(mesa, 2, 15).
homens(4).
tempo_max(60).


mudancas:-
    homens(NHomens),
    tempo_max(Limite),
    findall(Object-Men-Time,objecto(Object,Men,Time),Objects),
    length(Objects, N),
    length(Starts, N),
    domain(Starts, 0, Limite),
    length(Ends, N),
    domain(Ends, 0, Limite),
    
    createTasks(Objects, Starts, Ends, Tasks, 1),
    write(Tasks), nl,
    
    cumulative(Tasks, [limit(NHomens)]),
    
    append(Starts, Ends, Vars),
    labeling([], Vars),
    output(Objects, Starts, Ends).
 
createTasks([], [], [], [], _).
createTasks([_-Men-Time | Rem1], [S | Rem2], [E | Rem3], Tasks, Idx):-
    NewIdx is Idx+1,
    createTasks(Rem1, Rem2, Rem3, Aux, NewIdx),
    append(Aux, [task(S,Time,E,Men,Idx)], Tasks).
 
output([], [], []).
output([Obj-Men-_ | Rem1], [S | Rem2], [E | Rem3]):-
    write('Mover '),write(Obj),write(' ('),write(Men),write(' homens) desde t='),write(S),write(' ate t='),write(E),nl,
    output(Rem1, Rem2, Rem3).
	append(Aux,[task,S,Time,E,Men,Index], Tasks).


