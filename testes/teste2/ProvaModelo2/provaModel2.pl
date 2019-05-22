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
	(X1 #= Y1 #/\ X2 #\= Y2)
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


% Pergunta 12
seatDown2(L,N,Seats1,Seats2):-
	length(L,NPersons),
	length(Seats1,NPersons),
	length(Seats2,NPersons),
	domain(Seats1,1,NPersons),
	domain(Seats2,1,NPersons),
	all_distinct(Seats1),
	all_distinct(Seats2),

	different_pairs2(Seats1,Seats2),

	append(Seats1,Seats2,Seats),
	labeling([],Seats),
	show_seats2(L,N,Seats1),nl,
	show_seats2(L,N,Seats2),nl.

different_pairs2([],[]).
different_pairs2([_],[_]).
different_pairs2([X1,X2,X3|Xs],[Y1,Y2,Y3|Ys]):-
	(X1 #= Y1 #/\ 
	 X2 #\= Y2 #/\
	 X2 #\= Y3 #/\
	 X3 #\= Y3 #/\ 
	 X3 #\= Y2
	),
	different_pairs2(Xs,Ys).

show_seats2(Ppl,N,Seats):-
	length(Row,N),
	append(Row,SeatsSufix,Seats),!,
	write_people(Ppl,Row),
	show_seats2(Ppl,N,SeatsSufix).

show_seats2(Ppl,_,Seats):-
	write_people(Ppl,Seats).

write_people(Ppl,List):-
	get_ppl(Ppl,List,ListPpl),write(ListPpl),nl.

get_ppl(_,[],[]).
get_ppl(L,[X|Xs],[P,Ps]):-
	nth1(X,L,P),
	get_ppl(L,Xs,Ps).




