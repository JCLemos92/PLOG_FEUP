:-use_module(library(clpfd)).
:-use_module(library(lists)).


% Pergunta 11

seatDown(L,Seats1,Seats2):-
	length(L,NPersons),
	length(Seats1,NPersons),
	length(Seats2,NPersons),
	domain(Seats1,1,NPersons),
	domain(Seats2,1,NPersons),

	all_distinct(Seats1),
	all_distinct(Seats2),
	different_pairs(Seats1,Seats2),

	append(Seats1,Seats2,Seats),
	labeling([],Seats),

	show_seats(L,Seats1),nl,
	show_seats(L,Seats2),nl.

different_pairs([],[]).
different_pairs([_],[_]).
different_pairs([X1,X2 | Xs], [Y1,Y2| Ys]):-
	(X1 #= Y1 #/\ X2 #\= Y2),
	different_pairs(Xs,Ys).

show_seats(_,[]).
show_seats(L,[X]):-
	nth1(X,L,Person),
	write(Person),nl.

show_seats(L,[X1,X2 | Xs]):-
	nth1(X1,L,Person1),
	nth1(X2,L,Person2),
	write(Person1-Person2),nl,
	show_seats(L,Xs).