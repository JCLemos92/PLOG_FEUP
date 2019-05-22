%player(Name, UserName, Age).
player('Danny', 'Best Player Ever', 27).
player('Annie', 'Worst Player Ever', 24).
player('Harry', 'A-Star Player', 26).
player('Manny', 'The Player', 14).
player('Jonny', 'A Player', 16).


%game(Name, Categories, MinAge).
game('5 ATG', [action, adventure, open-world, multiplayer], 18).
game('Carrier Shift: Game Over', [action, fps, multiplayer, shooter], 16).
game('Duas Botas', [action, free, strategy, moba], 12).

%played(Player, Game, HoursPlayed, PercentUnlocked)
played('Best Player Ever', '5 ATG', 3, 83).
played('Worst Player Ever', '5 ATG', 52, 9).
played('The Player', 'Carrier Shift: Game Over', 44, 22).
played('A Player', 'Carrier Shift: Game Over', 48, 24).
played('A-Star Player', 'Duas Botas', 37, 16).
played('Best Player Ever', 'Duas Botas', 33, 22).

:-use_module(library(lists)).
timePlayingGames(Player, Games, ListOfTimes, SumTimes):-
	getHours(Player,Games,ListOfTimes),
	sumlist(ListOfTimes,Sum),
	SumTimes = Sum.

timePlayingGames(_,_,[0],0).
getHours(_,[],[]).
getHours(Player, [Game | Tail], ListOfTimes):-
	getHours(Player,Tail,NewListOfTimes),
	played(Player,PlayerGame,Hours,_),
	PlayerGame = Game,
	ListOfTimes = [Hours | NewListOfTimes].


:- use_module(library(lists)).

p1(L1,L2) :-
    gen(L1,L2),
    test(L2).

gen([],[]).
gen(L1,[X|L2]) :-
    select(X,L1,L3),
    gen(L3,L2).

test([_,_]).
test([X1,X2,X3|Xs]) :-
    (
    	X1 < X2, X2 > X3;
    	X1 > X2, X2 < X3
    ),
    test([X2,X3|Xs]).
