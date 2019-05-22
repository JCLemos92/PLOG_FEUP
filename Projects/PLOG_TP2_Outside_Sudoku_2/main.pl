:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(aggregate)).
:- use_module(library(system)).


:-[sudoku_cases].
:-[interface].
:-[solver].
:-[outside_sudoku_cases].
:-[outside_sudoku_solver].
:-[stats].
:-[get_value].

solve(P):-
    get_out_sudoku_entries(P,Entries),nl,
    write('Input Values:'),nl,
    display_outside_sudoku_entries(Entries),
    reset_timer,
    outside_sudoku(Puzzle,Entries),
    display_sudoku(Puzzle),nl,
    print_time,
	fd_statistics.


%normal sudoku solver used for first testing 
solve_sudoku(P):-
    get_sudoku(P, Puzzle),
    write('Problem: '),nl,
    display_sudoku(Puzzle),nl,
    reset_timer,
    sudoku_old(Puzzle),
    print_time,
    write('Solution: '),nl,
    display_sudoku(Puzzle),nl,
    print_time,
    fd_statistics.