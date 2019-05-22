:-use_module(library(lists)).
:-dynamic film/4.

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

%Pergunta6--------------------------------------------
elemsComuns([],[],_).
elemsComuns([Head | Tail], Common, List2):-
	elemsComuns(Tail, NewCommon, List2),
	member(Head,List2),!,
	Common = [Head | NewCommon].

elemsComuns([_ | Tail], Common, List2):-
	elemsComuns(Tail, NewCommon, List2),
	Common = NewCommon.


similarity(Film1, Film2, Similarity):-
	film(Film1,Cats1,Dur1,Avg1),
	film(Film2,Cats2,Dur2,Avg2),
	length(Cats1,L1),
	length(Cats2,L2),
	elemsComuns(Cats1,CommonCats,Cats2),
	length(CommonCats, LCommon),
	PercentCommonCat is (LCommon / (L1 + L2 - LCommon)) * 100,

	DurDiff is abs(Dur1 - Dur2),
	ScoreDiff is abs(Avg1 - Avg2),
	Similarity is PercentCommonCat - 2*DurDiff - 10*ScoreDiff.

%Pergunta7--------------------------------------------
maisSimilares(Filme, Filmes, Similaridade):-
	findall(Movie-Sim,( similarity(Filme,Movie,Sim), Sim > 10), List), sort(List,Ordered),write(Ordered),
	nth1(1,Ordered,First-Simi),
	Filmes = First,
	Similaridade = Simi.

maisSimilares(_,[],0).

%Pergunta8--------------------------------------------
distancia(User1, Distancia, User2):-
	user(User1,Year1,Country1),
	user(User2,Year2,Country2),
	vote(User1,Votes1),
	vote(User2,Votes2),
	getAvgDiff(Votes1,Votes2,AvgDiffList),
	length(AvgDiffList, L),
	sumlist(AvgDiffList,Sum),
	AvgDiff = Sum / L,

	AgeDiff = abs(Year1 - Year2),
	Country1 \= Country2,
	Distancia is AvgDiff + AgeDiff/3 + 2.

distancia(User1, Distancia, User2):-
	user(User1,Year1,_),
	user(User2,Year2,_),
	vote(User1,Votes1),
	vote(User2,Votes2),
	getAvgDiff(Votes1,Votes2,AvgDiffList),
	length(AvgDiffList, L),
	sumlist(AvgDiffList,Sum),
	AvgDiff is Sum / L,

	AgeDiff is abs(Year1 - Year2),
	Distancia is AvgDiff + AgeDiff/3 + 0.

getAvgDiff([],_,[]).
getAvgDiff([Movie-Vote1 | Tail], Votes2, Diff):-
	getAvgDiff(Tail,Votes2,NewDiff),
	member(Movie-Vote2,Votes2),
	AvgDiff is abs(Vote1 -Vote2),
	Diff = [AvgDiff | NewDiff].

getAvgDiff([_-_ | Tail], Votes2, Diff):-
	getAvgDiff(Tail,Votes2,NewDiff),
	Diff = NewDiff.

%Pergunta9--------------------------------------------
update(Film):-
	film(Film,Cats,Dur,OldAvg),
	findall(Vote,(vote(_,Votes),  member(Film-Vote,Votes)),ListVotes),
	length(ListVotes,L),
	sumlist(ListVotes,Sum),
	NewAvg is Sum / L,
	retract(film(Film,Cats,Dur,OldAvg)),
	assert(film(Film,Cats,Dur,NewAvg)).