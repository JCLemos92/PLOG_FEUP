:- use_module(library(lists)).

start(_):-
    choose_board_size(Size),
    draw_empty_board(Size).

choose_board_size(Size):-
    write('\nChoose board Size\nBoard Size must be between 5 and 15\nInput Value: '),
    read(Size),
    write('\n'),
    check_valid(Size),
    display_board_message(Size).

display_board_message(Size):-
    write('You have choosen a '), 
    write(Size), 
    write('x'), 
    write(Size),
    write(' board').

check_valid(Size):-
    Size>4,
    Size<16.

check_valid(Size):-
    Size<5,
    write('\nInvalid Input\n'),
    start(_).
    

check_valid(Size):-
    Size>15,
    write('\nInvalid Input\n'),
    start(_).

draw_empty_board(Size):- 
    Size>0,
    write('\n'),
    Alphabet=['NULL','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O'],
    %Null existe para o alfabeto começar no indice 1 ficando assim a letra a corresponder à coluna certa
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

draw_empty_board_rest(0).

draw_horizontal_padding(Size):-
    Size>0,
    write('-----'),
    X is Size-1,
    draw_horizontal_padding(X).

draw_horizontal_padding(0):-
    write('-\n').

draw_vertical_padding(Size):-
    Size>0,
    write('|'),
    draw_cell(_),
    X is Size-1,
    draw_vertical_padding(X).

draw_vertical_padding(0):-
    write('| \n').

draw_cell(_):-
    %futuramente irá procurar a peça e coloca-la em jogo
    write('    ').

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

draw_margin(_):-
    write('   ').