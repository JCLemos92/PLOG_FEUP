% prof_risco(Pessoa,Profissão)
prof_risco(rui,professor).
prof_risco(to,bombeiro).
prof_risco(marta,bombeiro).
prof_risco(hugo,fuzileiro).

% fuma_muito(Pessoa)
fuma_muito(sofia).
fuma_muito(rui).
fuma_muito(marta).
fuma_muito(pedro).

% dorme(Pessoa,Horas)
dorme(pedro,5).
dorme(joao,4).
dorme(marta,5).
dorme(sofia,8).
dorme(hugo,4).


%Pergunta 1 a)----------------------------------------------------------------------
dorme_pouco(P):-
	dorme(P,Horas),
	Horas < 6.

%Pergunta 1 b)----------------------------------------------------------------------
morre_cedo(P):-
	prof_risco(P,_).

morre_cedo(P):-
	fuma_muito(P),
	dorme_pouco(P).

%Pergunta 1 c)----------------------------------------------------------------------

%Força nisso

%Pergunta 1 d)----------------------------------------------------------------------
desgracado(P):-
	\+ coisa(P).

coisa(P):-
	prof_risco(P,Prof),
	prof_risco(P2,Prof),
	P \= P2.

%Pergunta 1 e)----------------------------------------------------------------------
listagem:-
	write('Nome          Profissão          FumaMuito         DormePouco     MorreCedo'),nl,
	write('====          =========          =========         ==========     ========='),nl,
	displayNames.


displayNames:-
	getNamesList(Names),
	displayInfo(Names).

getNamesList(Names):-
	findall(Name,dorme(Name,_),List1),
	findall(Name-Prof,prof_risco(Name,Prof),List2),
	findall(Name,fuma_muito(Name),List3),
	makeList(List1,List2,List3,Names).

makeList([],[],[],_).

makeList([_|T],[],[],_):-
	makeList(T,[],[],_).

makeList([],[_|T],[],_):-
	makeList([],T,[],_).

makeList([Name1| Tail1], [Name2-Prof2 | Tail2], [_| Tail3], Names):-
	makeList(Tail1,Tail2,Tail3,NewName),
	Name1 == Name2,
	Names = [Name1-Prof2|NewName].

makeList([_| Tail1], [Name2-Prof2 | Tail2], [Name3| Tail3], Names):-
	makeList(Tail1,Tail2,Tail3,NewName),
	Name3 == Name2,
	Names = [Name3-Prof2|NewName].

makeList([_| Tail1], [_-_ | Tail2], [Name3| Tail3], Names):-
	makeList(Tail1,Tail2,Tail3,NewName),
	Names = [Name3-'-'|NewName].

displayInfo([]).
displayInfo([Name-Prof | Tail]):-
	displayInfo(Tail),
	write(Name),write('          '),write(Prof),write('          '),
	displayFumaMuito(Name),
	displayDormePouco(Name),
	displayMorreCedo(Name),nl.


displayFumaMuito(Name):-
	fuma_muito(Name),
	write('X'),write('                 ').

displayFumaMuito(_):-
	write('                  ').

displayDormePouco(Name):-
	dorme_pouco(Name),
	write('X'),write('              ').

displayDormePouco(_):-
	write('               ').

displayMorreCedo(Name):-
	morre_cedo(Name),
	write('X'),write('        ').

displayMorreCedo(_):-
	write('         ').	
