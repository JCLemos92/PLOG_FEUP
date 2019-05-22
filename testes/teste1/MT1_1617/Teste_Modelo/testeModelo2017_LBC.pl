:- use_module(library(lists)).

%participant(Id,Age,Performance)
participant(1234, 17, 'Pé coxinho').
participant(3423, 21, 'Programar com os pés').
participant(3788, 20, 'Sing a Bit').
participant(4865, 22, 'Pontes de esparguete').
participant(8937, 19, 'Pontes de pen-drives').
participant(2564, 20, 'Moodle hack').

%performance(Id,Times)
performance(1234,[120,120,120,120]).
performance(3423,[32,120,45,120]).
performance(3788,[110,2,6,43]).
performance(4865,[120,120,110,120]).
performance(8937,[97,101,105,110]).

%Pergunta 1---------------------------------------------------------
madeItThrough(Participant):-
	participant(Participant,_,_),
	performance(Participant,Times),
	member(120,Times).

%Pergunta 2---------------------------------------------------------
juriTimes(Participants, Juri, Times, Total):-
	getParticipantsTimes(Participants,Juri,Times),
	sumlist(Times,Total).

getParticipantsTimes([],_,_).
getParticipantsTimes([Participant|Tail],Juri,Times):-
	getParticipantsTimes(Tail,Juri,NewTimes),
	performance(Participant,Performance),
	nth1(Juri,Performance,Time),
	Times = [Time|NewTimes].

%Pergunta 3---------------------------------------------------------
patientJuri(Juri):-
	performance(Id1,Lista1),
	performance(Id2,Lista2),
	Id1 \= Id2,
	nth1(Juri,Lista1,120),
	nth1(Juri,Lista2,120).

%Pergunta 4---------------------------------------------------------
bestParticipant(P1, P2, P):-
	performance(P1,Tempos1),
	performance(P2,Tempos2),
	sumlist(Tempos1,Total1),
	sumlist(Tempos2,Total2),
	Total1 > Total2,
	P is P1.

bestParticipant(P1, P2, P):-
	performance(P1,Tempos1),
	performance(P2,Tempos2),
	sumlist(Tempos1,Total1),
	sumlist(Tempos2,Total2),
	Total1 < Total2,
	P is P2.

%Pergunta 5---------------------------------------------------------
allPerfs:-
	participant(ID,_,Perf),
	performance(ID,Times),
	write(ID),write(':'),write(Perf),write(':'),write(Times),nl,
	fail.

allPerfs.

%Pergunta 6---------------------------------------------------------
nSuccessfulParticipants(T):-
	findall(Participant,noPress(Participant),Fans),
	length(Fans,T).

noPress(ID):-
	performance(ID,Lista),
	nth1(1,Lista,120),
	nth1(2,Lista,120),
	nth1(3,Lista,120),
	nth1(4,Lista,120).

%Pergunta 7---------------------------------------------------------
%encontrar para todos os IDs todos os indeces que tem 120
juriFans(JuriFansList):-
	findall(ID-Fans,getFans(ID,Fans),JuriFansList).

%encontrar todos os elementos 120 da Lista de pontuacoes
getFans(ID,Fans):-
	performance(ID,Lista),
	findall(Index,nth1(Index,Lista,120),Fans).

%Pergunta 8---------------------------------------------------------
eligibleOutcome(Id,Perf,TT) :-
    performance(Id,Times),
    madeItThrough(Id),
    participant(Id,_,Perf),
    sumlist(Times,TT).

nextPhase(N, Participants):-
	setof(TT-ID-Perf,eligibleOutcome(ID,Perf,TT),Result),
	reverse(Result,Ordered),
	findall(O,(nth1(Index,Ordered,O), Index =< N),Participants).
