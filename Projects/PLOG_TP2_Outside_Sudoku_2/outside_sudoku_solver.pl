:- use_module(library(clpfd)).

outside_sudoku(Puzzle,Entries):-
        Puzzle=[[A1,B1,C1,D1,E1,F1,G1,H1,I1],
        [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        [A9,B9,C9,D9,E9,F9,G9,H9,I9]],
    Vars = [A1,B1,C1,D1,E1,F1,G1,H1,I1,
            A2,B2,C2,D2,E2,F2,G2,H2,I2,
            A3,B3,C3,D3,E3,F3,G3,H3,I3,
            A4,B4,C4,D4,E4,F4,G4,H4,I4,
            A5,B5,C5,D5,E5,F5,G5,H5,I5,
            A6,B6,C6,D6,E6,F6,G6,H6,I6,
            A7,B7,C7,D7,E7,F7,G7,H7,I7,
            A8,B8,C8,D8,E8,F8,G8,H8,I8,
            A9,B9,C9,D9,E9,F9,G9,H9,I9],
    domain(Vars,1,9),
    solve_outside(Puzzle,Entries),
    sudoku(Puzzle),
    labeling([],Vars).

solve_outside(Puzzle,Entries):-
        Entries=[L|Ls],
        get_entries(Puzzle,L),
        solve_outside(Puzzle,Ls,2).
solve_outside(_,_,5).
solve_outside(Puzzle, Entries, Aux):-
        Entries=[L|Ls],
        get_entries(Puzzle,L),
        Aux2 is Aux+1,
        solve_outside(Puzzle,Ls,Aux2).
solve_outside(_,_,_).

get_entries(Puzzle,Entries):-
        Entries = Entry_point-List,
        %Entry_point is up, down, left or right
        %List is (coordenate - input list)
        solve_from_entry_point(Puzzle, Entry_point, List).

solve_from_entry_point(Puzzle, Entry_point, List):-
        List=[Index-Values|Ls],
        %Index is Coordenate
        %Values is input list
        length(Values, Length),
        get_value(Puzzle, Entry_point, Index, Values, Length, 1),
        solve_from_entry_point(Puzzle, Entry_point, Ls).
solve_from_entry_point(_,_,_).

