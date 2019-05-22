:- use_module(library(lists)).
:- dynamic film/4.

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


%Pergunta1---------------------------------------------------------
long(Movie):-
	film(Movie,_,Dur,_),
	Dur > 130.

%Pergunta2---------------------------------------------------------
diff(User1, User2, Difference, Film):-
	vote(User1, List1),
	vote(User2, List2),
	member(Film-Class1,List1),
	member(Film-Class2,List2),
	Difference is abs(Class1-Class2).

%Pergunta3---------------------------------------------------------
badPerson(User):-
	vote(User,List),
	member(Film1-Class1,List),
	member(Film2-Class2,List),
	Film1 \= Film2,
	Class1 =< 4,
	Class2 =< 4.

%Pergunta4---------------------------------------------------------
recursiveList([H|T],Common,Temp,List2):-
	member(H,List2),
	append(Temp,[H],NewTemp),
	recursiveList(T,Common,NewTemp,List2).

recursiveList([_|T],Common,Temp,List2):-
	recursiveList(T,Common,Temp,List2).

recursiveList([],Common,Temp,_):-
	append([],Temp,Common).

elemsComuns1([H|T], Common, List2):-
	recursiveList([H|T], Common,_, List2).


%outra versao!
elemsComuns([],[],_).

elemsComuns([Head1|Rest], Common, List2):-
	member(Head1,List2),!,
	Common = [Head1|TailCommon],
	elemsComuns(Rest,TailCommon,List2).

elemsComuns([_|Rest], Common, List2):-
	elemsComuns(Rest,Common,List2).


%Pergunta5---------------------------------------------------------
catFilms(Cat):-
	film(Title,Categories,Dur,Avg),
	member(Cat,Categories),
	write(Title),write(' - '),write(Dur),write('min, '),write(Avg),write('/10'),nl,
	fail.

catFilms(_).


%Pergunta6---------------------------------------------------------
similarity(Film1, Film2, Similarity):-
	film(Film1,Cats1,Dur1,Avg1),
	film(Film2,Cats2,Dur2,Avg2),
	elemsComuns(Cats1,Comuns,Cats2),
	length(Cats1,Num1),
	length(Cats2,Num2),
	length(Comuns,NumComun),
	PercentCommonCat = (NumComun / (Num1+Num2 - NumComun)) * 100,
	DurDiff = abs(Dur1-Dur2),
	ScoreDiff = abs(Avg1-Avg2),
	Similarity is PercentCommonCat - 2*DurDiff - 10*ScoreDiff.

%Pergunta7---------------------------------------------------------
maisSimilares(Filme, Filmes, Similaridade):-
	findall(SimFilmSet-FilmSet, similarityAux(Filme,FilmSet,SimFilmSet), FilmList),
	getFilmSim(FilmList,Filmes,Similaridade).

getFilmSim([],Filmes,Sim):-
	Sim = 0,
	Filmes = [].

getFilmSim([SimHead-FilmHead | Tail], Filmes, Sim):-
	getFilmSim(Tail,NewFilmes,NewSim),
	SimHead == NewSim,
	Filmes = [FilmHead|NewFilmes],
	Sim = SimHead.

getFilmSim([SimHead-FilmHead | Tail], Filmes, Sim):-
	getFilmSim(Tail,_,NewSim),
	SimHead > NewSim,
	Filmes = [FilmHead],
	Sim = SimHead.

getFilmSim([SimHead-_ | Tail], Filmes, Sim):-
	getFilmSim(Tail,NewFilm,NewSim),
	SimHead < NewSim,
	Filmes = NewFilm,
	Sim = NewSim.

similarityAux(Film1,Film2,Similaridade):-
	film(Film2,_,_,_),
	Film1 \= Film2,
	similarity(Film1,Film2,Similaridade).

%Pergunta8---------------------------------------------------------


%Pergunta9---------------------------------------------------------
update(Film) :-
	
	% Para todos os Utilizadores ir buscar o voto deles em relacao ao 'Film'
	% e fazer a lista de todos os Votos desse filme aka 'Scores'
	findall(Score, User^findallAux(Film, Score, User), Scores),

	% determinar Avg
	length(Scores, Length),
	sumlist(Scores, Sum),
	write(Scores), nl,
	NewScore is Sum/Length,

	% ir buscar o filme com
	film(Film, Categories, Time, OldScore),
	
	% atualizar retiraNDO O filme com pontuacao antiga
	assert(film(Film, Categories, Time, NewScore)),

	% colocar o novo filme com pontuacao nova
	retract(film(Film, Categories, Time, OldScore)).

%vai buscar o voto aka Score do Filme de um User 
findallAux(Film, Score, User):-
	vote(User,ListaVotos),
	getUserFilmScore(ListaVotos,Film,Score),
	Score == -1,
	fail.

findallAux(Film, Score, User):-
	vote(User,ListaVotos),
	getUserFilmScore(ListaVotos,Film,Score),
	Score \= -1.

% Percorre a lista de Votos do User ate ao fim e inicializa Score a -1
% Depois vai adicionando as Votacoes e se o Filme = Film entao atualiza
% o Score e nao continua a adicionar as Votaçoes do fim para o inicio e
% verifica se se trata da Votacao do Filme que estamos a procura

getUserFilmScore([], _, -1).
getUserFilmScore([UserFilm-UserScore|Tail],Film,Score):-
	getUserFilmScore(Tail,Film,_),
	UserFilm == Film,
	Score = UserScore.

getUserFilmScore([UserFilm-_|Tail],Film,Score):-
	getUserFilmScore(Tail,Film,NewScore),
	UserFilm \= Film,
	Score = NewScore.