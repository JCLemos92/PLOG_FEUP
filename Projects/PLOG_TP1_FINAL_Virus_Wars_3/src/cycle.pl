:-[helper_lib].
:-[interface].

loop_one(Board, Size, Type):-
    Type = 1,
    place_first_blue_player(Board, Size, 'Player1', NewBoard),
    draw_board(NewBoard,Size),
    place_first_red_player(NewBoard, Size, 'Player2', NewerBoard),
    draw_board(NewerBoard,Size),
    game_loop(NewerBoard, Size, Type).

game_loop(Board, Size, Type):-
    Type = 1,
    play_cycle_player([blue], Board, Size, 'Player1', NewBoard),
    play_cycle_player([red], NewBoard, Size, 'Player2', NewerBoard),
    game_loop(NewerBoard, Size, Type).

game_loop(Board, Size, Type):-
    Type = 2,
    play_cycle_player(red, Board, Size, 'Player', NewBoard),
    play_cycle_npc(blue, NewBoard, Size, 'NPC', NewerBoard),
    game_loop(NewerBoard, Size, Type).

game_loop(Board, Size, Type):-
    Type = 3,
    play_cycle_npc(red, Board, Size, 'NPC1', NewBoard),
    play_cycle_npc(blue, NewBoard, Size, 'NPC2', NewerBoard),
    game_loop(NewerBoard, Size, Type).

play_cycle_player(Piece, InBoard, Size, PlayerName, OutBoard) :-
    makePlay(Piece, InBoard, Size, PlayerName, OutB1, 1),
    draw_board(OutB1, Size),
    makePlay(Piece, OutB1, Size, PlayerName, OutB2, 2),
    draw_board(OutB2, Size),
    makePlay(Piece, OutB2, Size, PlayerName, OutB3, 3),
    draw_board(OutB3, Size),
    makePlay(Piece, OutB3, Size, PlayerName, OutB4, 4),
    draw_board(OutB4, Size),
    makePlay(Piece, OutB4, Size, PlayerName, OutBoard, 5),
    draw_board(OutBoard, Size).

makePlay(Piece, InBoard, Size, PlayerName, OutBoard, Num):-
    write_player_name(PlayerName, Num),
    ask_X_input(_),
    get_X_input(X),
    ask_Y_input(Size),
    get_Y_input(Y),
    place_piece(InBoard, X, Y, Piece, OutBoard, Size).
