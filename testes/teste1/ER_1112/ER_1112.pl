object(ball).
object(sofa).
object(table).
object(statue).
object(tv).
object(pillow).
object(book).

made_of(ball, plastic).
made_of(sofa, tissue).
made_of(table, wood).
made_of(statue, wood).
made_of(tv, plastic).
made_of(pillow, tissue).
made_of(book, paper).

on(tv, table).
on(ball, table).
on(pillow, sofa).
on(book, pillow).
on(statue, tv).

%Pergunta 1 a)------------------------------------------------------
under(X,Y):-
	on(Y,X).


%Pergunta 1 b)------------------------------------------------------
below(X,Y):-
	undex(X,Y).

below(X,Y):-
	under(X,Z),
	below(Z,Y).

%Pergunta 1 c)------------------------------------------------------
unique(X):-
	\+ isUnique(X).

isUnique(X):-
	made_of(X,M),
	made_of(Y,M),
	X \= Y.

%Pergunta 1 d)------------------------------------------------------
on_same(X,Y,Z):-
	on(X,Z),
	on(Y,Z),
	X \= Y.

on_same(X,Y,floor):-
	object(X),
	object(Y),
	\+ on(X,_),
	\+ on(Y,_).

%Pergunta 1 e)------------------------------------------------------
describe:-
	made_of(X, M),
	write('the '), write(X), write(' is made of '), write(M), nl,
	fail.

describe.

%Pergunta 1 f)------------------------------------------------------
down_to_floor(X, [X|R]) :-
	on(X, Y), down_to_floor(Y, R).

down_to_floor(X, [X]) :-
	\+ on(X, _).

%Pergunta 1 g)------------------------------------------------------

% Como cada objeto está em cima de apenas um outro, o segundo
% objetivo tem apenas uma solução, ao passo que o primeiro poderá
% ter um número de soluções elevado. Isto dará origem a um
% número elevado de retrocessos. Sugere-se portanto que os objetivos
% sejam trocados: ?- on(tv, X), made_of(X, madeira).