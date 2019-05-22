:-use_module(library(lists)).
:-use_module(library(aggregate)).



%Pergunta 1-----------------------------------------------------------------------
raro(Movie):-
	film(Movie,_,Dur,_),
	Dur < 60.

raro(Movie):-
	film(Movie,_,Dur,_),
	Dur > 120.

%Pergunta 2-----------------------------------------------------------------------
happierGuy(User1, User2, HappierGuy):-
	vote(User1,Votes1),!,
	vote(User2,Votes2),
	getAvg(Votes1,Avgs1),
	getAvg(Votes2,Avgs2),
	length(Avgs1,L1),
	length(Avgs2,L2),
	sumlist(Avgs1,Sum1),
	sumlist(Avgs2,Sum2),
	Avg1 is Sum1 / L1,
	Avg2 is Sum2 / L2,
	Avg1 > Avg2,
	HappierGuy = User1.

happierGuy(_, User2, HappierGuy):-
	HappierGuy = User2.

getAvg([],[]).
getAvg([_-Vote | Tail], Avgs):-
	getAvg(Tail, NewAvgs),
	Avgs = [Vote | NewAvgs].

%Pergunta 3-----------------------------------------------------------------------
likedBetter(User1, User2):-
	vote(User1,Votes1),
	vote(User2,Votes2),
	max_member(_-Rate1,Votes1),
	max_member(_-Rate2,Votes2),
	Rate1 > Rate2.

%Pergunta 4-----------------------------------------------------------------------
recommends(User,Movie):-
	vote(RandomUser, VotesRandom),!,
	vote(User,UserVotes),
	RandomUser \= User,
	getRecomended(VotesRandom,UserVotes,Movie).

getRecomended([],_,_).
getRecomended([Film-_|Tail],UserVotes,Movie):-
	getRecomended(Tail,UserVotes,Movie),
	\+ member(Film-_,UserVotes),
	Movie = Film.

getRecomended([Film-_|Tail],UserVotes,Movie):-
	getRecomended(Tail,UserVotes,Movie),
	member(Film-_,UserVotes).

%Pergunta 5-----------------------------------------------------------------------
invert(Predicate/Arity):-
	functor(T,Predicate,Arity),
	retract(T),
	asserta(T),
	fail.
invert(_).

%Pergunta 6-----------------------------------------------------------------------
onlyOne(User1,User2,OnlyOneList):-
	vote(User1,Votes1),
	vote(User2,Votes2),
	findall(Movie1,( member(Movie1-_,Votes1), \+member(Movie1-_,Votes2) ), List1),
	findall(Movie2,( member(Movie2-_,Votes2), \+member(Movie2-_,Votes1) ), List2),
	append(List1,List2,OnlyOneList).


%film(Title, Categories, Duration, AvgClassification).
film('Doctor Strange', [action, adventure, fantasy], 115, 7.6).
film('Hacksaw Ridge', [biography, drama, romance], 131, 8.7).
film('Inferno', [action, adventure, crime], 121, 6.4).
film('Arrival', [drama, mystery, scifi], 116, 8.5).
film('The Accountant', [action, crime, drama], 127, 7.6).
film('The Girl on the Train', [drama, mystery, thriller], 112, 6.7).

%user(Username, YearOfBirth, Country)
user(john, 1992, 'USA').
user(jack, 1989, 'UK').
user(peter, 1983, 'Portugal').
user(harry, 1993, 'USA').
user(richard, 1982, 'USA').

%vote(Username, List_of_Film-Rating)
vote(john, ['Inferno'-7, 'Doctor Strange'-9, 'The Accountant'-6]).
vote(jack, ['Inferno'-8, 'Doctor Strange'-8, 'The Accountant'-7]).
vote(peter, ['The Accountant'-4, 'Hacksaw Ridge'-7, 'The Girl on the Train'-3]).
vote(harry, ['Inferno'-7, 'The Accountant'-6]).
vote(richard, ['Inferno'-10, 'Hacksaw Ridge'-10, 'Arrival'-9]).

%Pergunta 8-----------------------------------------------------------------------
dumpDataBase(Filename):-
	open(Filename,write,Stream),
	forall(film(Movie,Cats,Dur,Avg),(write(Stream,film(Movie,Cats,Dur,Avg)),nl(Stream))),

	forall(user(Username, YearOfBirth, Country),(write(Stream, user(Username, YearOfBirth, Country)), nl(Stream))),

	forall(vote(Username, List), (write(Stream, vote(Username, List)), nl(Stream))),

	close(Stream).

%Pergunta 9-----------------------------------------------------------------------
nNumeros(Lista,Quantos):-
	getQuant(Lista,ListaQuantidade),
	write(ListaQuantidade),
	sumlist(ListaQuantidade,Quantos).

getQuant([],[]).
getQuant([Num1-Num2 | Tail], Qtd):-
	getQuant(Tail,NewQtd),
	Num2 > Num1,!,
	Quatidade is Num2 - Num1 + 1,
	Qtd = [Quatidade | NewQtd].

getQuant([_-_ | Tail], Qtd):-
	getQuant(Tail, NewQtd),
	Qtd = [1 | NewQtd].

%Pergunta 10-----------------------------------------------------------------------
intersetam(Lista1, Lista2):-
	checkIntersection(Lista1,Lista2, Value),
	Value == true.

checkIntersection([],_,_).
checkIntersection([Num1-Num2 | Tail], Lista2, Value):-
	checkIntersection(Tail,Lista2, Value),
	member(Num1-_, Lista2);
	member(Num2-_, Lista2),
	Value = true.

checkIntersection([_-_ | Tail], Lista2, Value):-
	checkIntersection(Tail,Lista2, Value).