:-use_module(library(lists)).
:-dynamic film/4.



%Pergunta1---------------------------------------------------------------------
long(Movie):-
	film(Movie,_,Dur,_),
	Dur > 130.


%Pergunta2---------------------------------------------------------------------
diff(User1, User2, Difference, Film):-
	vote(User1,Votes1),
	vote(User2,Votes2),
	member(Film-Vote1,Votes1),
	member(Film-Vote2,Votes2),
	Difference is abs(Vote1 - Vote2).

%Pergunta3---------------------------------------------------------------------
badPerson(User):-
	vote(User,Votes),
	member(Film1-Vote1,Votes),
	member(Film2-Vote2,Votes),
	Film1 \= Film2,
	Vote1 =< 4,
	Vote2 =< 4.

%Pergunta4---------------------------------------------------------------------
elemsComuns([],[],_).
elemsComuns([Head | Tail], Common, List2):-
	elemsComuns(Tail, NewCommon, List2),
	member(Head,List2),!,
	Common = [Head | NewCommon].

elemsComuns([_ | Tail], Common, List2):-
	elemsComuns(Tail, NewCommon, List2),
	Common = NewCommon.

%Pergunta5---------------------------------------------------------------------
catFilms(Category):-
	film(Movie,Cats,Dur,Avg),
	member(Category,Cats),
	write(Movie),write(' - '),write(Dur),write('min, '),write(Avg),write('/10'),nl,
	fail.

catFilms(_).

%Pergunta6---------------------------------------------------------------------
similarity(Film1, Film2, Similarity):-
	film(Film1,Cats1,Dur1,Avg1),
	film(Film2,Cats2,Dur2,Avg2),
	length(Cats1, L1),
	length(Cats2, L2),
	elemsComuns(Cats1,CommonCats,Cats2),
	length(CommonCats, NumCommon),
	PercentCommonCat = NumCommon / ((L1+L2) - NumCommon) * 100,
	DurDiff = abs(Dur1 - Dur2),
	ScoreDiff = abs(Avg1 - Avg2),
	Similarity is PercentCommonCat - 2 * DurDiff - 10 * ScoreDiff. 


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

%Pergunta7---------------------------------------------------------------------
maisSimilares(Filme, Filmes, Similaridade):-
	findall(Sim-Movie,(similarity(Filme,Movie,Sim), Filme \= Movie),SimList),
	max_member(Similaridade-Film,SimList),!,
	Similaridade > 10,
	Filmes = [Film].

maisSimilares(_,[],0).

%Pergunta8---------------------------------------------------------------------
distancia(User1, Distancia, User2):-
	user(User1,Year1,Country1),
	user(User2,Year2,Country2),
	vote(User1,Votes1),
	vote(User2,Votes2),
	
	findall(VoteDiff,((member(Movie-Vote1,Votes1), member(Movie-Vote2,Votes2), VoteDiff is abs(Vote1 - Vote2))),VoteDiffList),
	length(VoteDiffList,L),
	sumlist(VoteDiffList,Sum),
	AvgDiff = (Sum / L),
	Country1 == Country2,
	CountryDiff = 0,
	AgeDiff is abs(Year1 - Year2),
	Distancia is AvgDiff + AgeDiff / 3 + CountryDiff.

distancia(User1, -Distancia, +User2):-
	user(User1,Year1,_),
	user(User2,Year2,_),
	vote(User1,Votes1),
	vote(User2,Votes2),
	getAvgDiff(Votes1,Votes2,AvgsDiff),
	length(AvgsDiff,L),
	sum(AvgsDiff,Sum),
	AvgDiff = (Sum / L),
	CountryDiff = 2,
	AgeDiff is abs(Year1 - Year2),
	Distancia is AvgDiff + AgeDiff / 3 + CountryDiff.

%Pergunta9---------------------------------------------------------------------

update(Film):-
	film(Film,Cats,Dur,OldAvg),
	findall(Vote,(vote(_,Votes),member(Film-Vote,Votes)), FilmVotes),
	length(FilmVotes,L),
	sumlist(FilmVotes,Sum),
	NewAvg is Sum / L,
	assert(film(Film,Cats,Dur,NewAvg)),
	retract(film(Film,Cats,Dur,OldAvg)).