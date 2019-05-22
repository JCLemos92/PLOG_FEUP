display_sudoku(Puzzle):-
    draw_line,
    draw_interior(0,Puzzle),
    draw_line.

draw_interior(3, Puzzle):-
    draw_line_int,
    Aux is 4,
    write('|'),
    write_cells(0, 3, Puzzle),
    draw_interior(Aux, Puzzle).

draw_interior(6, Puzzle):-
    draw_line_int,
    Aux is 7,
    write('|'),
    write_cells(0, 6, Puzzle),
    draw_interior(Aux, Puzzle).

draw_interior(9, _).

draw_interior(I, Puzzle):-
    Aux is I+1,
    write('|'),
    write_cells(0, I, Puzzle),
    draw_interior(Aux, Puzzle).
draw_interior(_,_).


write_cells(9, _, _):-
    write('|'), nl.

write_cells(2, Y, Puzzle):-
    get_cell(2, Y, Puzzle),
    write('|'),
    X2 is 3,
    write_cells(X2, Y, Puzzle).

write_cells(5, Y, Puzzle):-
    get_cell(5, Y, Puzzle),
    write('|'),
    X2 is 6,
    write_cells(X2, Y, Puzzle).

write_cells(X, Y, Puzzle):-
    get_cell(X, Y, Puzzle),
    X2 is X+1,
    write_cells(X2, Y, Puzzle).

get_cell(X, Y, Board) :-
	nth0(Y, Board, Column),
	nth0(X, Column, Cell),
    integer(Cell),
    write(' '),
    write(Cell),
    write(' ').

get_cell(X, Y, Board) :-
	nth0(Y, Board, Column),
	nth0(X, Column, _),
    write(' * ').

draw_line:-
    write('-------------------------------'),nl.

draw_line_int:-
    write('|-----------------------------|'),nl.

display_outside_sudoku_entries(Puzzle):-
    Puzzle=[L|Ls],
    display_entries(L),nl,
    display_outside_sudoku_entries(Ls,2).

display_outside_sudoku_entries(_,5).
display_outside_sudoku_entries(Puzzle, Aux):-
    Puzzle=[L|Ls],
    display_entries(L),nl,
    Aux2 is Aux+1,
    display_outside_sudoku_entries(Ls,Aux2).

display_entries(L):-
    L=Entry_point-List,
    write(Entry_point), write(' variables:'),nl,
    display_list(List,1),nl.
display_entries(_).

display_list(List,Count):-
    List=[Index-Lx|Ls],
    length(Lx, Length),
    write('     '),
    write(Index),write(' - '), display_values(Lx,1,Length),nl,
    C is Count+1,
    display_list(Ls,C).
display_list([]).

display_values(Values,Max,Max):-
    Values = [A],
    write(A),
    write(';').
display_values(Values,X,Max):-
    X \= Max,
    Values = [A|B],
    write(A),
    write(','),
    NewX is X+1,
    display_values(B,NewX,Max).

