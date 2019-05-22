:- use_module(library(lists)).
:- [helper_lib].

%create_empty_board(Board, Size):-
 %   generate_matrix(Size, Size, Board).

create_empty_board(Length, Width, Board) :-
    length(Row, Width),
    maplist(=([]), Row),         % A row of empty lists, forming an empty row
    length(Board, Length),
    maplist(=(Row), Board).      % A list of empty rows

%returns the cell at X,Y position in board
getCell(Board, X, Y, Cell) :-
	nth0(Y, Board, Column),
	nth0(X, Column, Cell).

place_piece(Board, X, Y, Piece, NewBoard, Size) :-
	checkValidMove(Piece, Board, X, Y, Size),
	nth0(Y, Board, Column),
	nth0(X, Column, Cell),
    select_piece(Cell, Piece, NewPiece),
	append(Cell, NewPiece, NewCell),
	replaceAtListIndex(Column, X, NewCell, NewColumnValue),
	replaceAtListIndex(Board, Y, NewColumnValue, NewBoard).

select_piece(Cell, Piece, NewPiece):-
    Cell == [],
    NewPiece = Piece.

select_piece(Cell, Piece, NewPiece):-
    Cell == [red],
    Piece == [blue],
    NewPiece = [zb].

select_piece(Cell, Piece, NewPiece):-
    Cell == [blue],
    Piece == [red],
    NewPiece = [zr].

select_piece(_, _, _):-
   write('Invalid Piece'),nl,fail.

check_in_bounds(X, Y, Size) :-
    X >= 0, X < Size,
    Y >= 0, Y < Size.


checkValidMove(Piece, Board, X, Y, Size):-
    check_in_bounds(X, Y, Size),
    check_valid(Piece, Board, X, Y).
    %check_valid_piece(X, Y, Board).

check_valid(Piece, Board, X, Y):-
    Piece == [red],
    P = [blue,zr],
    P2 = [zr],
    Right is X+1,
    Up is Y-1,
    Left is X-1,
    Down is Y+1,
    (check_adjacent_coodenates(Piece, Board, X, Y, Right, Up, Left, Down);
    check_adjacent_coodenates(P, Board, X, Y, Right, Up, Left, Down);
    check_adjacent_coodenates(P2, Board, X, Y, Right, Up, Left, Down)).


check_valid(Piece, Board, X, Y):-
    Piece == [blue],
    P = [red,zb],
    P2 = [zb],
    Right is X+1,
    Up is Y-1,
    Left is X-1,
    Down is Y+1,
    (check_adjacent_coodenates(Piece, Board, X, Y, Right, Up, Left, Down);
    check_adjacent_coodenates(P, Board, X, Y, Right, Up, Left, Down);
    check_adjacent_coodenates(P2, Board, X, Y, Right, Up, Left, Down)).

check_adjacent_coodenates(Piece, Board, X, Y, Right, Up, Left, Down):-
    (check_if_ok(Piece, Board, Left, Up);
    check_if_ok(Piece, Board, X, Up);
    check_if_ok(Piece, Board, Right, Up);
    check_if_ok(Piece, Board, Left, Y);
    check_if_ok(Piece, Board, Right, Y);
    check_if_ok(Piece, Board, Left, Down);
    check_if_ok(Piece, Board, X, Down);
    check_if_ok(Piece, Board, Right, Down)).

check_if_ok(Piece, Board, X, Y):-
    nth0(Y, Board, Column),
	nth0(X, Column, Cell),
    Cell == Piece.

place_first_blue_player(Board, Size, PlayerName, NewBoard):-
    Piece = [blue],
    X is 0,
    display_firstPlayer_message(PlayerName),
    get_Y_input(Y),
    nth0(Y, Board, Column),
	nth0(X, Column, Cell),
	append(Cell, Piece, NewCell),
	replaceAtListIndex(Column, X, NewCell, NewColumnValue),
	replaceAtListIndex(Board, Y, NewColumnValue, NewBoard).

place_first_red_player(Board, Size, PlayerName, NewBoard):-
    Piece = [red],
    X is Size-1,
    display_secoundPlayer_message(PlayerName),
    get_Y_input(Y),
    nth0(Y, Board, Column),
	nth0(X, Column, Cell),
	append(Cell, Piece, NewCell),
	replaceAtListIndex(Column, X, NewCell, NewColumnValue),
	replaceAtListIndex(Board, Y, NewColumnValue, NewBoard).



new_test(Board) :-
    Board = [
        [[],[red],[],[],[]],
        [[],[zb],[],[],[]],
        [[],[],[],[blue],[]],
        [[],[zr],[],[],[]],
        [[],[],[],[],[red]]
    ].

