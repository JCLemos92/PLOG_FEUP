:-[board].
:-[interface].
:-[cycle].
:-[helper_lib].


start(_):-
    displayTitleCard(_),
    repeat,
    displayInstructions(_),
    chooseOption(_),
    %chooseGameType(Type),
    choose_board_size(Size),
    create_empty_board(Size, Size, Board),
    draw_board(Board,Size),
    Type is 1,
    loop_one(Board, Size, Type).
    %game_loop(Board,Size,Type).

chooseGameType(Choice):-
    display_game_types(_),
    choose_game_type(Choice).

test(_):-
    new_test(Board),
    write('Example: '), nl,
    draw_board(Board,5), nl,
    place_piece(Board, 2, 2, [red], NewBoard, 5),
    write('Added red piece at C-3: '),nl,
    draw_board(NewBoard,5),
    place_piece(NewBoard, 2, 2, [blue], NewerBoard, 5),
    write('Added blue piece at C-3, red piece becomes Zombie Blue:'),nl,
    draw_board(NewerBoard, 5),
    showProblem(NewerBoard).