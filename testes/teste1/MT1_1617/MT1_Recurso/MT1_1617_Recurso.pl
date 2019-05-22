:-use_module(library(lists)).

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

%Pergunta1------------------------------------------------------------------
raro(Movie):-
	film(Movie,_,Dur,_),
	Dur < 60.

raro(Movie):-
	film(Movie,_,Dur,_),
	Dur > 120.

%Pergunta2------------------------------------------------------------------
happierGuy(User1,User2,HappierGuy):-
	vote(User1,Votes1),
	vote(User2,Votes2),
	getAvgs(Votes1,Avgs1),
	getAvgs(Votes2,Avgs2),
	length(Avgs1,L1),
	length(Avgs2,L2),
	sumlist(Avgs1,Sum1),
	sumlist(Avgs2,Sum2),
	Avg1 = Sum1 / L1,
	Avg2 = Sum2 / L2,
	Avg1 > Avg2,
	HappierGuy = User1.

happierGuy(User1,User2,HappierGuy):-
	vote(User1,Votes1),
	vote(User2,Votes2),
	getAvgs(Votes1,Avgs1),
	getAvgs(Votes2,Avgs2),
	length(Avgs1,L1),
	length(Avgs2,L2),
	sumlist(Avgs1,Sum1),
	sumlist(Avgs2,Sum2),
	Avg1 = Sum1 / L1,
	Avg2 = Sum2 / L2,
	Avg1 < Avg2,
	HappierGuy = User2.

getAvgs([],[]).
getAvgs([_-Avg|Tail],Avgs):-
	getAvg(Tail,NewAvg),
	Avgs = [Avg|NewAvg].

%Pergunta3------------------------------------------------------------------
likedBetter(User1,User2):-
	vote(User1, Votes1),
	getAvgs(Votes1, Avgs),
	sort(Avgs, Ordered1),
	nth1(1, Ordered1, Max1),

	vote(User2, Votes2),
	getAvgs(Votes2, Avgs2),
	sort(Avgs2, Ordered2),
	nth1(1, Ordered2, Max2),

	Max1 > Max2.

%Pergunta4------------------------------------------------------------------
recommends(User1,Movie):-
	vote(User1,Votes1),
	vote(User2,Votes2),
	User1 \= User2,!,

	% vai buscar a lista de filmes diferentes ao User1
	getDifferent(Votes1,Votes2,Differents),

	% seleciona o primeiro diferente
	nth1(1,Differents,Movie).


getDifferent([],[],[]).

% Para caso a lista ter tamanho diferente da segunda
getDifferent([],[_|T], []):-
	getDifferent([],T,_).

% Se o filme for diferente, entao adiciona
getDifferent([Movie1-_ | Tail1],[Movie2-_ | Tail2], Differents):-
	getDifferent(Tail1,Tail2,NewDiff),
	Movie1 \= Movie2,
	Differents = [Movie2 | NewDiff].

% Se o filme for igual, entao descarta
getDifferent([Movie1-_ | Tail1],[Movie2-_ | Tail2], Differents):-
	getDifferent(Tail1,Tail2,NewDiff),
	Movie1 == Movie2,
	Differents = NewDiff.

%Pergunta5------------------------------------------------------------------
:- dynamic vote/2.
invert(PredicateSymbol/Arity):-
	functor(T,PredicateSymbol,Arity),
	retract(T),
	asserta(T),
	fail.
invert(_).

%Pergunta6------------------------------------------------------------------
onlyOne(User1,User2,OnlyOneList):-
	vote(User1,Votes1),
	vote(User2,Votes2),
	getNotSeenByUser2(Votes1,Votes2,List1),
	getNotSeenByUser1(Votes2,Votes1,List2),!,
	append(List1,List2,OnlyOneList).


getNotSeenByUser2([],[],[]).

getNotSeenByUser2([],[_|T],[]):-
	getNotSeenByUser2([],T,_).

getNotSeenByUser2([Movie1-_|Tail1],Votes2,OnlyOneList):-
	getNotSeenByUser2(Tail1,Votes2,NewList),
	\+ member(Movie1-_,Votes2),
	OnlyOneList = [Movie1|NewList].

getNotSeenByUser2([_-_|Tail1],Votes2,OnlyOneList):-
	getNotSeenByUser2(Tail1,Votes2,NewList),
	OnlyOneList = NewList.



getNotSeenByUser1([],[],[]).

getNotSeenByUser1([],[_|T],[]):-
	getNotSeenByUser1([],T,_).

getNotSeenByUser1([Movie2-_|Tail2],Votes1,OnlyOneList):-
	getNotSeenByUser2(Tail2,Votes1,NewList),
	\+ member(Movie2-_,Votes1),
	OnlyOneList = [Movie2|NewList].

getNotSeenByUser1([_-_|Tail2],Votes1,OnlyOneList):-
	getNotSeenByUser2(Tail2,Votes1,NewList),
	OnlyOneList = NewList.

%Pergunta7------------------------------------------------------------------

%Pergunta8------------------------------------------------------------------
dumpDataBase(FileName):-
	open(FileName,write,Stream),
	(
		user(Name,Year,Country), outputUser(Name,Year,Country,Stream), fail;
		true
	),
	
	(
		film(Title, Categories, Duration, AvgClassification), outputFilm(Title, Categories, Duration, AvgClassification,Stream), fail;
		true
	),

	(
		vote(Username, List_of_Film-Rating), outputVote(Username, List_of_Film-Rating,Stream), fail;
		true
	),
	close(Stream).

outputUser(Name,Year,Country,Stream):-
		write(Stream,'user('),
		write(Stream,Name),write(Stream,', '),write(Stream,Year),write(Stream,', '),write(Stream,Country),
		write(Stream,').'),
		nl(Stream).

outputFilm(Title, Categories, Duration, AvgClassification,Stream):-
		write(Stream, 'film('),
		write(Stream,Title),write(Stream,', '),write(Stream, Categories),write(Stream,', '),write(Stream, Duration),write(Stream,', '),write(Stream, AvgClassification),
		write(Stream,').'),
		nl(Stream).

outputVote(Username, List_of_Film-Rating,Stream):-
		write(Stream,'vote('),
		write(Stream,Username),write(Stream,', '),write(Stream,List_of_Film-Rating),
		write(Stream,').'),
		nl(Stream).

%Pergunta9-----------------------------------------------------------------
nNumeros(Lista,Qtd):-
	nNumerosAux(Lista,ListaQtd),
	sumlist(ListaQtd,Qtd).

nNumerosAux([],[]).
nNumerosAux([Num1-Num2|Tail],Qtd):-
	nNumerosAux(Tail,NewQtd),
	Qtd =	 [Num2 -Num1 + 1 | NewQtd].	

%Pergunta10-----------------------------------------------------------------
intersetam([],_).
intersetam(Lista1, Lista2):-
	getListElems(Lista1,Elems1),
	getListElems2(Lista1,Elems2),
	append(Elems1,Elems2,Elems).

getListElems([],[]).
getListElems([Num1-_ | Tail],Elems):-
	getListElems(Tail,NewElems),
	Elems = [Num1 | NewElems].

getListElems2([],[]).
getListElems2([_-Num2 | Tail],Elems):-
	getListElems2(Tail,NewElems),
	Elems = [Num2 | NewElems].
	