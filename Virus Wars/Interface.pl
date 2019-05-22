:- use_module(library(lists)).

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

printBoardExplanation(_) :-
	write('\n\Write Rules\n').

chooseOption(_) :-
	read(X),nl,
	(
		X == 1 -> printBoardExplanation(_),fail;
		X == 2 -> !;
		X == 3 -> halt(0);
		invalidInputMessageDisplay(_),fail
	).

invalidInputMessageDisplay(_) :-
	write('Invalid Input'),nl.

continueScreen(_) :-
	write('Continue?\n1 - Yes\n2 - No'),nl,
	read(X),nl,
	(
		X == 1 -> start(_);
		X == 2 -> halt(0);
		invalidInputMessageDisplay(_),fail
	).

choose_board_size(Size):-
    write('\nChoose board Size\nBoard Size must be between 5 and 15\nInput Value: '),
    read(Size),
    write('\n'),
    check_valid(Size),
    display_board_message(Size).

draw_column_name(Size,X,Alphabet):-
    X =< Size,
    nth0(X,Alphabet,Output),
    write('  '),
    write(Output),
    write('  '),
    Y is X+1,
    draw_column_name(Size,Y,Alphabet).

drawBoard(Board,Size):-
    X is 0,
    Y is 0,
    Alphabet=['NULL','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O'],
    draw_margin(_),
    draw_column_name(Size,1,Alphabet),
    draw_horizontal_padding(Size),
    drawBoardInterior(Board, X, Y, Size).

drawBoardInterior(Board, X, Y, Size):-
    Linha is X + 1,
    write(Linha), 
    write('  '),
    draw_vertical_padding(Board, 0, Y, Size),
    draw_margin(_),
    draw_horizontal_padding(Size),
    NewY is Y+1,
    drawBoardInterior(Board, 0, NewY, Size).

draw_vertical_padding(Board, X, Y, Size):-
    Size>0,
    write('|'),
    draw_cell(Board, X, Y),
    X is X+1,
    draw_vertical_padding(Board, X, Y, Size).

draw_vertical_padding(Board, Size, Y, Size):-
    write('|\n').

draw_cell(Board,X,Y):-
    

draw_empty_board(Size,_,_):- 
    Size>0,
    write('\n'),
    Alphabet=['NULL','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O'],
    draw_margin(_),
    draw_column_name(Size,1,Alphabet),
    draw_margin(_),
    draw_horizontal_padding(Size),
    write('1  '),
    draw_vertical_padding(Size),
    draw_margin(_),
    draw_horizontal_padding(Size),
    X is Size-1,
    Num is 2,
    draw_empty_board_rest(Size,X,Num).

draw_empty_board_rest(Original,Size,Num):-
    Size>0,
    write(Num),
    write('  '),
    draw_vertical_padding(Original),
    draw_margin(_),
    draw_horizontal_padding(Original),
    X is Size-1,
    Aux is Num + 1,
    draw_empty_board_rest(Original,X,Aux).

draw_margin(_):-
    write('   ').

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

draw_horizontal_padding(Size):-
    Size>0,
    write('-----'),
    X is Size-1,
    draw_horizontal_padding(X).

draw_horizontal_padding(0):-
    write('-\n').



draw_vertical_padding(0):-
    write('| \n').

