count(1,([A1,A2,A3]),#=,Vars),
    count(1,([A1,A2,A3]),#=,Vars),
    count(2,([B1,B2,B3]),#=,Vars),
    count(5,([B1,B2,B3]),#=,Vars),
    count(3,([C1,C2,C3]),#=,Vars),
    count(6,([C1,C2,C3]),#=,Vars),
    count(4,([D1,D2,D3]),#=,Vars),
    count(7,([D1,D2,D3]),#=,Vars),
    count(5,([E1,E2,E3]),#=,Vars),
    count(8,([E1,E2,E3]),#=,Vars),
    count(6,([F1,F2,F3]),#=,Vars),
    count(9,([F1,F2,F3]),#=,Vars),

    count(8,([A3,B3,C3]),#=,Vars),
    count(2,([A4,B4,C4]),#=,Vars),
    count(7,([A5,B5,C5]),#=,Vars),
    count(9,([A5,B5,C5]),#=,Vars),
    count(1,([A6,B6,C6]),#=,Vars),
    count(3,([A6,B6,C6]),#=,Vars),
    count(4,([A7,B7,C7]),#=,Vars),
    count(8,([A7,B7,C7]),#=,Vars),
    count(5,([A8,B8,C8]),#=,Vars),
    count(6,([A8,B8,C8]),#=,Vars),
    count(3,([A9,B9,C9]),#=,Vars),

    count(6,([G1,H1,I1]),#=,Vars),
    count(9,([G1,H1,I1]),#=,Vars),
    count(2,([G2,H2,I2]),#=,Vars),
    count(8,([G2,H2,I2]),#=,Vars),
    count(5,([G3,H3,I3]),#=,Vars),
    count(7,([G3,H3,I3]),#=,Vars),
    count(4,([G4,H4,I4]),#=,Vars),
    count(6,([G4,H4,I4]),#=,Vars),
    count(2,([G5,H5,I5]),#=,Vars),
    count(8,([G6,H6,I6]),#=,Vars),
    count(7,([G7,H7,I7]),#=,Vars),    
    
    count(3,([D7,D8,D9]),#=,Vars),
    count(5,([D7,D8,D9]),#=,Vars),
    count(1,([E7,E8,E9]),#=,Vars),
    count(4,([E7,E8,E9]),#=,Vars),
    count(2,([F7,F8,F9]),#=,Vars),
    count(8,([F7,F8,F9]),#=,Vars),
    count(2,([G7,G8,G9]),#=,Vars),
    count(3,([G7,G8,G9]),#=,Vars),
    count(4,([H7,H8,H9]),#=,Vars),
    count(7,([H7,H8,H9]),#=,Vars),
    count(5,([I7,I8,I9]),#=,Vars),
    count(8,([I7,I8,I9]),#=,Vars), 



        % Rows
    all_different([A1,B1,C1,D1,E1,F1,G1,H1,I1]),
    all_different([A2,B2,C2,D2,E2,F2,G2,H2,I2]),
    all_different([A3,B3,C3,D3,E3,F3,G3,H3,I3]),
    all_different([A4,B4,C4,D4,E4,F4,G4,H4,I4]),
    all_different([A5,B5,C5,D5,E5,F5,G5,H5,I5]),
    all_different([A6,B6,C6,D6,E6,F6,G6,H6,I6]),
    all_different([A7,B7,C7,D7,E7,F7,G7,H7,I7]),
    all_different([A8,B8,C8,D8,E8,F8,G8,H8,I8]),
    all_different([A9,B9,C9,D9,E9,F9,G9,H9,I9]),

    % Columns
    all_different([A1,A2,A3,A4,A5,A6,A7,A8,A9]),
    all_different([B1,B2,B3,B4,B5,B6,B7,B8,B9]),
    all_different([C1,C2,C3,C4,C5,C6,C7,C8,C9]),
    all_different([D1,D2,D3,D4,D5,D6,D7,D8,D9]),
    all_different([E1,E2,E3,E4,E5,E6,E7,E8,E9]),
    all_different([F1,F2,F3,F4,F5,F6,F7,F8,F9]),
    all_different([G1,G2,G3,G4,G5,G6,G7,G8,G9]),
    all_different([H1,H2,H3,H4,H5,H6,H7,H8,H9]),
    all_different([I1,I2,I3,I4,I5,I6,I7,I8,I9]),

    %Squares
    all_different([A1,A2,A3,B1,B2,B3,C1,C2,C3]),
    all_different([D1,D2,D3,E1,E2,E3,F1,F2,F3]),
    all_different([G1,G2,G3,H1,H2,H3,I1,I2,I3]),

    all_different([A4,A5,A6,B4,B5,B6,C4,C5,C6]),
    all_different([D4,D5,D6,E4,E5,E6,F4,F5,F6]),
    all_different([G4,G5,G6,H4,H5,H6,I4,I5,I6]),

    all_different([A7,A8,A9,B7,B8,B9,C7,C8,C9]),
    all_different([D7,D8,D9,E7,E8,E9,F7,F8,F9]),
    all_different([G7,G8,G9,H7,H8,H9,I7,I8,I9]).


    X in 1..9,

    count(1,([A1,A2,A3]),#=,X),
    count(4,([A1,A2,A3]),#=,X),
    count(2,([B1,B2,B3]),#=,X),
    count(5,([B1,B2,B3]),#=,X),
    count(3,([C1,C2,C3]),#=,X),
    count(6,([C1,C2,C3]),#=,X),
    count(4,([D1,D2,D3]),#=,X),
    count(7,([D1,D2,D3]),#=,X),
    count(5,([E1,E2,E3]),#=,X),
    count(8,([E1,E2,E3]),#=,X),
    count(6,([F1,F2,F3]),#=,X),
    count(9,([F1,F2,F3]),#=,X),

    count(8,([A3,B3,C3]),#=,X),
    count(2,([A4,B4,C4]),#=,X),
    count(7,([A5,B5,C5]),#=,X),
    count(9,([A5,B5,C5]),#=,X),
    count(1,([A6,B6,C6]),#=,X),
    count(3,([A6,B6,C6]),#=,X),
    count(4,([A7,B7,C7]),#=,X),
    count(8,([A7,B7,C7]),#=,X),
    count(5,([A8,B8,C8]),#=,X),
    count(6,([A8,B8,C8]),#=,X),
    count(3,([A9,B9,C9]),#=,X),
    count(7,([A9,B9,C9]),#=,X),

    count(6,([G1,H1,I1]),#=,X),
    count(9,([G1,H1,I1]),#=,X),
    count(2,([G2,H2,I2]),#=,X),
    count(8,([G2,H2,I2]),#=,X),
    count(5,([G3,H3,I3]),#=,X),
    count(7,([G3,H3,I3]),#=,X),
    count(4,([G4,H4,I4]),#=,X),
    count(6,([G4,H4,I4]),#=,X),
    count(2,([G5,H5,I5]),#=,X),
    count(3,([G5,H5,I5]),#=,X),
    count(8,([G6,H6,I6]),#=,X),
    count(6,([G7,H7,I7]),#=,X),    
    
    count(3,([D7,D8,D9]),#=,X),
    count(5,([D7,D8,D9]),#=,X),
    count(1,([E7,E8,E9]),#=,X),
    count(4,([E7,E8,E9]),#=,X),
    count(2,([F7,F8,F9]),#=,X),
    count(8,([F7,F8,F9]),#=,X),
    count(2,([G7,G8,G9]),#=,X),
    count(3,([G7,G8,G9]),#=,X),
    count(4,([H7,H8,H9]),#=,X),
    count(7,([H7,H8,H9]),#=,X),
    count(5,([I7,I8,I9]),#=,X),
    count(8,([I7,I8,I9]),#=,X),

    
% Rows
    all_different([A1,B1,C1,D1,E1,F1,G1,H1,I1]),
    all_different([A2,B2,C2,D2,E2,F2,G2,H2,I2]),
    all_different([A3,B3,C3,D3,E3,F3,G3,H3,I3]),
    all_different([A4,B4,C4,D4,E4,F4,G4,H4,I4]),
    all_different([A5,B5,C5,D5,E5,F5,G5,H5,I5]),
    all_different([A6,B6,C6,D6,E6,F6,G6,H6,I6]),
    all_different([A7,B7,C7,D7,E7,F7,G7,H7,I7]),
    all_different([A8,B8,C8,D8,E8,F8,G8,H8,I8]),
    all_different([A9,B9,C9,D9,E9,F9,G9,H9,I9]),

    % Columns
    all_different([A1,A2,A3,A4,A5,A6,A7,A8,A9]),
    all_different([B1,B2,B3,B4,B5,B6,B7,B8,B9]),
    all_different([C1,C2,C3,C4,C5,C6,C7,C8,C9]),
    all_different([D1,D2,D3,D4,D5,D6,D7,D8,D9]),
    all_different([E1,E2,E3,E4,E5,E6,E7,E8,E9]),
    all_different([F1,F2,F3,F4,F5,F6,F7,F8,F9]),
    all_different([G1,G2,G3,G4,G5,G6,G7,G8,G9]),
    all_different([H1,H2,H3,H4,H5,H6,H7,H8,H9]),
    all_different([I1,I2,I3,I4,I5,I6,I7,I8,I9]),

    %Squares
    all_different([A1,A2,A3,B1,B2,B3,C1,C2,C3]),
    all_different([D1,D2,D3,E1,E2,E3,F1,F2,F3]),
    all_different([G1,G2,G3,H1,H2,H3,I1,I2,I3]),

    all_different([A4,A5,A6,B4,B5,B6,C4,C5,C6]),
    all_different([D4,D5,D6,E4,E5,E6,F4,F5,F6]),
    all_different([G4,G5,G6,H4,H5,H6,I4,I5,I6]),

    all_different([A7,A8,A9,B7,B8,B9,C7,C8,C9]),
    all_different([D7,D8,D9,E7,E8,E9,F7,F8,F9]),
    all_different([G7,G8,G9,H7,H8,H9,I7,I8,I9]),


get_value(Puzzle, up, 1, Values, Length, I):-
Puzzle=[[A1,B1,C1,D1,E1,F1,G1,H1,I1],
        [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        [A9,B9,C9,D9,E9,F9,G9,H9,I9]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A1,A2,A3]),#=,X),
        get_value(Puzzle, up, 1, Ls, Length, NextI).
get_value(Puzzle, up, 2, Values, Length, I):-
Puzzle=[[A1,B1,C1,D1,E1,F1,G1,H1,I1],
        [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        [A9,B9,C9,D9,E9,F9,G9,H9,I9]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([B1,B2,B3]),#=,X),
        get_value(Puzzle, up, 2, Ls, Length, NextI).
get_value(Puzzle, up, 3, Values, Length, I):-
Puzzle=[[A1,B1,C1,D1,E1,F1,G1,H1,I1],
        [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        [A9,B9,C9,D9,E9,F9,G9,H9,I9]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([C1,C2,C3]),#=,X),
        get_value(Puzzle, up, 3, Ls, Length, NextI).
get_value(Puzzle, up, 4, Values, Length, I):-
Puzzle=[[A1,B1,C1,D1,E1,F1,G1,H1,I1],
        [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        [A9,B9,C9,D9,E9,F9,G9,H9,I9]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([D1,D2,D3]),#=,X),
        get_value(Puzzle, up, 4, Ls, Length, NextI).
get_value(Puzzle, up, 5, Values, Length, I):-
Puzzle=[[A1,B1,C1,D1,E1,F1,G1,H1,I1],
        [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        [A9,B9,C9,D9,E9,F9,G9,H9,I9]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([E1,E2,E3]),#=,X),
        get_value(Puzzle, up, 5, Ls, Length, NextI).
get_value(Puzzle, up, 6, Values, Length, I):-
Puzzle=[[A1,B1,C1,D1,E1,F1,G1,H1,I1],
        [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        [A9,B9,C9,D9,E9,F9,G9,H9,I9]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([F1,F2,F3]),#=,X),
        get_value(Puzzle, up, 6, Ls, Length, NextI).
get_value(Puzzle, up, 7, Values, Length, I):-
Puzzle=[[A1,B1,C1,D1,E1,F1,G1,H1,I1],
        [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        [A9,B9,C9,D9,E9,F9,G9,H9,I9]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G1,G2,G3]),#=,X),
        get_value(Puzzle, up, 7, Ls, Length, NextI).
get_value(Puzzle, up, 8, Values, Length, I):-
Puzzle=[[A1,B1,C1,D1,E1,F1,G1,H1,I1],
        [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        [A9,B9,C9,D9,E9,F9,G9,H9,I9]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([H1,H2,H3]),#=,X),
        get_value(Puzzle, up, 8, Ls, Length, NextI).
get_value(Puzzle, up, 9, Values, Length, I):-
Puzzle=[[A1,B1,C1,D1,E1,F1,G1,H1,I1],
        [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        [A9,B9,C9,D9,E9,F9,G9,H9,I9]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([I1,I2,I3]),#=,X),
        get_value(Puzzle, up, 9, Ls, Length, NextI).
get_value(_,_,_,_,_,_).