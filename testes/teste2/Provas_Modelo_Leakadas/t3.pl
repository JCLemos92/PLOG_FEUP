:- use_module(library(clpfd)).
:- use_module(library(lists)).
 
docente(pedro, m, 3, 6).
docente(joana, f, 3, 4).
docente(carla, f, 2, 5).
docente(mauro, m, 2, 4).
docente(david, m, 3, 4).
docente(maria, f, 1, 6).

solve(Vars):-
	findall(Sex-Ini-Fim,docente(_,Sex,Ini,Fim),Lista),
	length(Lista,NDoc),
	length(Vars,NDoc),
	dominios(Vars,Lista),

	all_distinct(Vars),

	avaliacao(Vars,Lista,FAval),!,
	minimize((labeling([],Vars),write(FAval-Vars),nl),FAval).

dominios([],[]).
dominios([Var | Vars], [_-Ini-Fim | Docentes]):-
	Var in Ini..Fim,
	dominios(Vars,Docentes).

avaliacao([],[],0).
avaliacao([Var | Vars], [Sex-Ini-Fim | Docentes], F_Aval2):-
	Sex == f,
	F_Aval2 #= F_Aval+Var,
	avaliacao(Vars,Docentes,F_Aval).

avaliacao([Var | Vars], [Sex-Ini-Fim | Docentes], F_Aval):-
	F_Aval2 #= F_Aval,
	avaliacao(Vars,Docentes,F_Aval).