:-use_module(library(lists)).

%Pergunta1---------------------------------------------------------
 madeItThrough(Participant):-
 	participant(Participant,_,_),
 	performance(Participant,Lista),
 	member(120,Lista).

%Pergunta2---------------------------------------------------------
juriTimes(Lista, Juri, Times, Total):-
	getJuriTimes(Lista,Juri,Times),
	sumlist(Times,Total).
	
getJuriTimes([],_,[]).
getJuriTimes([ID | Tail], Juri, Times):-
	getJuriTimes(Tail,Juri,NewTimes),
	performance(ID,Lista),
	nth1(Juri,Lista,JuriTime),
	Times = [JuriTime | NewTimes].

%Pergunta3---------------------------------------------------------
patientJuri(Juri):-
	performance(ID1,Lista1),
	performance(ID2,Lista2),
	ID1 \= ID2,
	nth1(Juri,Lista1,120),
	nth1(Juri,Lista2,120).

%Pergunta4---------------------------------------------------------
bestParticipant(P1, P2, P):-
	performance(P1,Lista1),
	performance(P2,Lista2),
	sumlist(Lista1,Sum1),
	sumlist(Lista2,Sum2),
	Sum1 > Sum2,
	P = P1.

bestParticipant(P1, P2, P):-
	performance(P1,Lista1),
	performance(P2,Lista2),
	sumlist(Lista1,Sum1),
	sumlist(Lista2,Sum2),
	Sum1 < Sum2,
	P = P2.

%Pergunta5---------------------------------------------------------
allPerfs:-
	performance(ID,Lista),
	participant(ID,_,Perf),
	write(ID),write(':'),write(Perf),write(':'),write(Lista),nl,
	fail.
allPerfs.

%Pergunta6---------------------------------------------------------
nSuccessfulParticipants(T):-
	findall(_,( performance(_,Lista),nth1(1,Lista,120),nth1(2,Lista,120),nth1(3,Lista,120),nth1(4,Lista,120) ),Fans),
	length(Fans,T).


participant(1234, 17, 'Pé coxinho').
participant(3423, 21, 'Programar com os pés').
participant(3788, 20, 'Sing a Bit').
participant(4865, 22, 'Pontes de esparguete').
participant(8937, 19, 'Pontes de pen-drives').
participant(2564, 20, 'Moodle hack').

performance(1234,[120,120,120,120]).
performance(3423,[32,120,45,120]).
performance(3788,[110,2,6,43]).
performance(4865,[120,120,110,120]).
performance(8937,[97,101,105,110]).

%Pergunta7---------------------------------------------------------
juriFans(JuriFansList):-
	findall(ID-ListaJuris,( performance(ID,Lista), getListFans(Lista, ListaJuris) ), JuriFansList).


getListFans(Lista,ListaFans):-
	findall(Index, nth1(Index, Lista, 120), ListaFans).

%Pergunta8---------------------------------------------------------
eligibleOutcome(Id,Perf,TT):-
    performance(Id,Times),
    madeItThrough(Id),
    participant(Id,_,Perf),
    sumlist(Times,TT).

nextPhase(N,Participants):-
	setof(TT-ID-Perf, eligibleOutcome(ID,Perf,TT), NextFaseList),
	reverse(NextFaseList,Ordered),
	getNElements(N,Ordered,Participants).

getNElements(0,_,[]).
getNElements(N,[Participant | Tail], Participants):-
	Participants = [Participant| NewParticipants],
	N1 is N - 1,
	getNElements(N1,Tail,NewParticipants).

%Pergunta9---------------------------------------------------------
predX(Q,[R|Rs],[P|Ps]):-
    participant(R,I,P), I=<Q, !,
    predX(Q,Rs,Ps).

predX(Q,[R|Rs],Ps):-
    participant(R,I,_), I>Q,
    predX(Q,Rs,Ps).

predX(_,[],[]).

% Mostra todas as performances que de participantes em [R |Rs] que tem idade inferior a unificada com Q.

%Pergunta10---------------------------------------------------------
impoe(X,L):-
    length(Mid,X),
    append(L1,[X|_],L), append(_,[X|Mid],L1).