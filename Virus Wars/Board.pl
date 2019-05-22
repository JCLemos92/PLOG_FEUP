draw_board_example(Size):-
    Board=[
        [ ['B'], ['r'], ['r'], [], [] ],
        [ ['B'], ['b'], [], [], [] ],
        [ [], ['b'], ['b'], ['r'], [] ],
        [ [], [], ['R'], ['R'], []],
        [ [], [], [], [], [] ]    
        ],
    write('\n'),
    Alphabet=['NULL','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O'],
    draw_margin(_),
    draw_column_name(Size,1,Alphabet),
    draw_margin(_),
    draw_horizontal_padding(Size),
    write('1  '),
    draw_vertical_padding(Size,Board),
    draw_margin(_),
    draw_horizontal_padding(Size),
    X is Size-1,
    Num is 2,
    draw_empty_board_rest(Size,X,Num,Board).

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


draw_board_example(Size):-
    Board=[
        [ ['B'], ['r'], ['r'], [], [] ],
        [ ['B'], ['b'], [], [], [] ],
        [ [], ['b'], ['b'], ['r'], [] ],
        [ [], [], ['R'], ['R'], []],
        [ [], [], [], [], [] ]    
        ],
    write('\n'),
    Alphabet=['NULL','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O'],
    draw_margin(_),
    draw_column_name(Size,1,Alphabet),
    draw_margin(_),
    draw_horizontal_padding(Size),
    write('1  '),
    draw_vertical_padding_new(Size,Board,X,Y),
    draw_margin(_),
    draw_horizontal_padding(Size),
    Aux is Size-1,
    Num is 2,
    draw_empty_board_rest(Size,Aux,Num,Board).

draw_vertical_padding_new(Size,Board):-
    Size>0,
    write('|'),
    draw_cell(Board),
    X is Size-1,
    draw_vertical_padding(X).

createEmptyBoard(Board,5):-
    Board=[
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ]     
    ].

createEmptyBoard(Board,6):-
    Board=[
        [ [], [], [], [], [], []],
        [ [], [], [], [], [], []],
        [ [], [], [], [], [], []],
        [ [], [], [], [], [], []],
        [ [], [], [], [], [], []],
        [ [], [], [], [], [], []],
    ].

    
    
