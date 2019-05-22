:- [Board.pl]
:- [Interface.pl]

start(_):-
    displayTitleCard(_),
    repeat,
    displayInstructions(_),
    chooseOption(_),
    choose_board_size(Size),
    createEmptyBoard(Board,Size),
    draw_board(Board,Size).
    %gameloop(_).
    %draw_empty_board(+Size,_,_).
