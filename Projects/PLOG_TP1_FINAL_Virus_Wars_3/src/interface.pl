:- use_module(library(lists)).
:-[board].

displayTitleCard(_) :-
write('\n\t**************************************'),
write('\n\t*                                    *'),
write('\n\t*            Virus_Wars_3            *'),
write('\n\t*                                    *'),
write('\n\t**************************************').

displayInstructions(_) :-
	write('\n1 - Instructions'),nl,
	write('2 - Start playing'),nl,
	write('3 - Exit'),nl.

display_game_types(_) :-
    write('\n1 - Player vs Player'),nl,
	write('2 - Player vs NPC'),nl,
	write('3 - NPC vs NPC'),nl,
    write('4 - Exit'),nl.

printBoardExplanation(_) :-
	write('\nWrite Rules\n').

chooseOption(_) :-
	read(X),nl,
	(
		X == 1 -> printBoardExplanation(_),fail;
		X == 2 -> !;
		X == 3 -> halt(0);
		invalidInputMessageDisplay(_),fail
	).

showProblem(Board) :-
    write('See Board List? [1-Yes 2-No] :'),
	read(X),nl,
	(
		X == 1 -> write('Board: '),write(Board),nl,fail;
		X == 2 -> !;
		invalidInputMessageDisplay(_),fail
	).

choose_game_type(X) :-
    read(X),nl,
    (
        X == 1 -> print_type(1),fail;
        X == 2 -> print_type(2),fail;
        X == 3 -> print_type(3),fail;
        X == 4 -> halt(0);
        invalidInputMessageDisplay(_),fail
    ).
    

continueScreen(_) :-
	write('Continue?\n1 - Yes\n2 - No'),nl,
	read(X),nl,
	(
		X == 1 -> start(_),fail;
		X == 2 -> halt(0);
		invalidInputMessageDisplay(_),fail
	).

invalidInputMessageDisplay(_) :-
	write('Invalid Input'),nl.

print_type(X):-
    X = 1,
    write('You have choosen Player vs Player'),nl.

print_type(X):-
    X = 2,
    write('You have choosen Player vs NPC'),nl.

print_type(X):-
    X = 3,
    write('You have choosen NPC vs NPC'),nl.

choose_board_size(Size):-
    write('\nChoose board Size\nBoard Size must be between 5 and 10\nInput Value: '),
    read(Size),
    write('\n'),
    check_valid(Size),
    display_board_message(Size).

draw_board(Board,Size):-
    Y is 0,
    Alphabet=['NULL','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O'],
    draw_margin(_),
    draw_column_name(Size,1,Alphabet),
    draw_margin(_),
    draw_horizontal_padding(Size),
    draw_board_interior(Board, Y, Size).

draw_column_name(Size,X,Alphabet):-
    X =< Size,
    nth0(X,Alphabet,Output),
    write('  '),
    write(Output),
    write('  '),
    Y is X+1,
    draw_column_name(Size,Y,Alphabet).

draw_column_name(Size,Size,_):-
    write('\n').

draw_board_interior(Board, Y, Size):-
    Y < Size,
    Line is Y + 1,
    write(Line), 
    write('  '),
    draw_vertical_padding(Board, 0, Y, Size),
    draw_margin(_),
    draw_horizontal_padding(Size),
    NewY is Y+1,
    draw_board_interior(Board, NewY, Size).

draw_board_interior(_, Size, Size).

draw_horizontal_padding(Size):-
    Size>0,
    write('-----'),
    X is Size-1,
    draw_horizontal_padding(X).
    
draw_horizontal_padding(0):-
    write('-\n').


draw_vertical_padding(Board, X, Y, Size):-
    X < Size,
    getCell(Board, X, Y, Cell),
    write('|'),
    draw_cell(Cell),
    %write('    '),
    NewX is X+1,
    draw_vertical_padding(Board, NewX, Y, Size).

draw_vertical_padding(_, Size, _, Size):-
    Size = Size,
    write('|\n').

draw_cell(Cell):-
    Cell == [blue],
    write('blue').

draw_cell(Cell):-
    Cell == [zb],
    write('zomb').

draw_cell(Cell):-
    Cell == [zr],
    write('zomr').

draw_cell(Cell):-
    Cell == [red,zb],
    write('zomb').

draw_cell(Cell):-
    Cell == [blue,zr],
    write('zomr').

draw_cell(Cell):-
    Cell == [red,blue],
    write('zomb').

draw_cell(Cell):-
    Cell == [blue,red],
    write('zomr').

draw_cell(Cell):-
    Cell == [],
    write('    ').

draw_cell(Cell):-
    Cell == [red],
    write('red ').

draw_cell(_):-
    write('    ').
    
draw_margin(_):-
    write('   ').

check_valid(Size):-
    Size>4,
    Size<11.

check_valid(Size):-
    Size<5,
    write('\nInvalid Input\n'),
    start(_).

check_valid(Size):-
    Size>10,
    write('\nInvalid Input\n'),
    start(_).

display_board_message(Size):-
    write('You have choosen a '), 
    write(Size), 
    write('x'), 
    write(Size),
    write(' board\n').

write_player_name(PlayerName, X):-
    write(PlayerName),
    write(' play '),
    write(X),
    write(' of 5.'), nl.

ask_X_input(_):-
    write('X coordenate: [A...J]: ').

ask_Y_input(Size):-
    write('Y coordenate: [1...'),
    write(Size),
    write(']: ').

get_X_input(X):-
	read(Num),nl,
	((
		Num == 'A' -> X is 0;
        Num == 'B' -> X is 1;
        Num == 'C' -> X is 2;
        Num == 'D' -> X is 3;
        Num == 'E' -> X is 4;
        Num == 'F' -> X is 5;
        Num == 'G' -> X is 6;
        Num == 'H' -> X is 7;
        Num == 'I' -> X is 8;
        Num == 'J' -> X is 9;
        Num == 'a' -> X is 0;
        Num == 'b' -> X is 1;
        Num == 'c' -> X is 2;
        Num == 'd' -> X is 3;
        Num == 'e' -> X is 4;
        Num == 'f' -> X is 5;
        Num == 'g' -> X is 6;
        Num == 'h' -> X is 7;
        Num == 'i' -> X is 8;
        Num == 'j' -> X is 9;
        invalidInputMessageDisplay(_),fail)
	).

get_Y_input(Y):-
    read(Num),nl,
    Y is Num - 1.

display_firstPlayer_message(PlayerName):-
    write(PlayerName),
    write(' Choose Line to place the 1st Blue Piece: ').

display_secoundPlayer_message(PlayerName):-
    write(PlayerName),
    write(' Choose Line to place the 1st Red Piece: ').
