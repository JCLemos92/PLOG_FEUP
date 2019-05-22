:-use_module(library(lists)).

hours([7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5]).

airTime('The Walking Dead',sunday,9).
airTime('Game of Thrones',sunday,8.5).
airTime('The Big Bang Theory',monday,8).
airTime('How I Met Your Mother',thursday,8).
airTime('Mad Men',sunday,10).

views('The Walking Dead',11).
views('Game of Thrones',5).
views('The Big Bang Theory',9).
views('Mad Men',2.5).
views('How I Met Your Mother',19).

network('The Walking Dead',amc).
network('Mad Men',amc).
network('Game of Thrones',hbo).
network('The Big Bang Theory',cbs).
network('How I Met Your Mother',cbs).

%Pergunta 1 a)--------------------------------------------------------------------
tvShowNetwork(Network,DayOfWeek,Hour,TvShow):-
	airTime(TvShow,DayOfWeek,Hour),
	network(TvShow,Network).

%Pergunta 1 b)--------------------------------------------------------------------
mostViews(Network,TvShow,DayOfWeek,Hour):-
	network(TvShow1,Network),
	network(TvShow2,Network),
	TvShow1 \= TvShow2,
	views(TvShow1,Views1),
	views(TvShow2,Views2),
	Views1 >= Views2,
	TvShow = TvShow1,
	airTime(TvShow1,DayOfWeek,Hour).

mostViews(Network,TvShow,DayOfWeek,Hour):-
	network(TvShow1,network),
	network(TvShow2,Network),
	TvShow1 \= TvShow2,
	views(TvShow1,Views1),
	views(TvShow2,Views2),
	Views1 < Views2,
	TvShow = TvShow2,
	airTime(TvShow2,DayOfWeek,Hour).

%Pergunta 1 c)--------------------------------------------------------------------
hottestTvShows(Networks,TvShows):-
	getHottest(Networks,TvShows).

getHottest([],[]).

getHottest([Network | Tail], TvShows):-
	getHtottest(Tail,NewTvShows),
	mostViews(Network,TvShow,_,_),
	TvShows = [TvShow | NewTvShows].

%Pergunta 1 d)---------------------Acho que Nao esta bem--------------------------
schedule(Network,DayOfWeek,Schedule):-
	findall(TvShow-Hour,(network(TvShow,Network),airTime(TvShow,DayOfWeek,Hour)),TvShows),
	getschedule(TvShows,ScheduleNotOrdered),
	sort(ScheduleNotOrdered,Ordered),
	reverse(Ordered,Schedule).

getschedule([],[]).
getschedule([TvShow-Hour | Tail], Schedule):-
	getschedule(Tail,NewSchedule),
	Schedule = [TvShow-Hour | NewSchedule].

%Pergunta 1 e)--------------------------------------------------------------------
averageViewers(Network,DayOfWeek,Average):-
	findall(Show, (network(Show,Network),airTime(Show,DayOfWeek,_)),TvShows),
	getViews(TvShows,Views),
	length(Views,L),
	sumlist(Views,Sum),
	Average is Sum/L.

getViews([],[]).
getViews([TvShow | Tail], ViewsList):-
	getViews(Tail, NewAvg),
	views(TvShow,Avg),
	ViewsList = [Avg | NewAvg].