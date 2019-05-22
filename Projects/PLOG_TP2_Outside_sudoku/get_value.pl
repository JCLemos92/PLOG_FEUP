get_value(_,_,_,_,Length,I):- I>Length.
get_value(Puzzle, up, 1, Values, Length, I):-
        I=<Length,
        Puzzle=[[A1|_],[A2|_],[A3|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A1,A2,A3]),#=,X),
        get_value(Puzzle, up, 1, Ls, Length, NextI).
get_value(Puzzle, up, 2, Values, Length, I):-
        I=<Length,
        Puzzle=[[_,B1|_],[_,B2|_],[_,B3|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([B1,B2,B3]),#=,X),
        get_value(Puzzle, up, 2, Ls, Length, NextI).
get_value(Puzzle, up, 3, Values, Length, I):-
        I=<Length,
        Puzzle=[[_,_,C1|_],[_,_,C2|_],[_,_,C3|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([C1,C2,C3]),#=,X),
        get_value(Puzzle, up, 3, Ls, Length, NextI).
get_value(Puzzle, up, 4, Values, Length, I):-
        I=<Length,
        Puzzle=[[_,_,_,D1|_],[_,_,_,D2|_],[_,_,_,D3|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([D1,D2,D3]),#=,X),
        get_value(Puzzle, up, 4, Ls, Length, NextI).
get_value(Puzzle, up, 5, Values, Length, I):-
        I=<Length,
        Puzzle=[[_,_,_,_,E1|_],[_,_,_,_,E2|_],[_,_,_,_,E3|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([E1,E2,E3]),#=,X),
        get_value(Puzzle, up, 5, Ls, Length, NextI).
get_value(Puzzle, up, 6, Values, Length, I):-
        I=<Length,
        Puzzle=[[_,_,_,_,_,F1|_],[_,_,_,_,_,F2|_],[_,_,_,_,_,F3|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([F1,F2,F3]),#=,X),
        get_value(Puzzle, up, 6, Ls, Length, NextI).
get_value(Puzzle, up, 7, Values, Length, I):-
        I=<Length,
        Puzzle=[[_,_,_,_,_,_,G1|_],[_,_,_,_,_,_,G2|_],[_,_,_,_,_,_,G3|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G1,G2,G3]),#=,X),
        get_value(Puzzle, up, 7, Ls, Length, NextI).
get_value(Puzzle, up, 8, Values, Length, I):-
        I=<Length,
        Puzzle=[[_,_,_,_,_,_,_,H1|_],[_,_,_,_,_,_,_,H2|_],[_,_,_,_,_,_,_,H3|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([H1,H2,H3]),#=,X),
        get_value(Puzzle, up, 8, Ls, Length, NextI).
get_value(Puzzle, up, 9, Values, Length, I):-
        I=<Length,
        Puzzle=[[_,_,_,_,_,_,_,_,I1],[_,_,_,_,_,_,_,_,I2],[_,_,_,_,_,_,_,_,I3]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([I1,I2,I3]),#=,X),
        get_value(Puzzle, up, 9, Ls, Length, NextI).
get_value(Puzzle, left, 1, Values, Length, I):-
        I=<Length,
        Puzzle=[[A1,B1,C1|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A1,B1,C1]),#=,X),
        get_value(Puzzle, left, 1, Ls, Length, NextI).
get_value(Puzzle, left, 2, Values, Length, I):-
        I=<Length,
        Puzzle=[_,[A2,B2,C2|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A2,B2,C2]),#=,X),
        get_value(Puzzle, left, 2, Ls, Length, NextI).
get_value(Puzzle, left, 3, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,[A3,B3,C3|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A3,B3,C3]),#=,X),
        get_value(Puzzle, left, 3, Ls, Length, NextI).
get_value(Puzzle, left, 4, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,[A4,B4,C4|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A4,B4,C4]),#=,X),
        get_value(Puzzle, left, 4, Ls, Length, NextI).
get_value(Puzzle, left, 5, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,_,[A5,B5,C5|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A5,B5,C5]),#=,X),
        get_value(Puzzle, left, 5, Ls, Length, NextI).
get_value(Puzzle, left, 6, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,_,_,[A6,B6,C6|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A6,B6,C6]),#=,X),
        get_value(Puzzle, left, 6, Ls, Length, NextI).
get_value(Puzzle, left, 7, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,_,_,_,[A7,B7,C7|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A7,B7,C7]),#=,X),
        get_value(Puzzle, left, 7, Ls, Length, NextI).
get_value(Puzzle, left, 8, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,_,_,_,_,[A8,B8,C8|_]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A8,B8,C8]),#=,X),
        get_value(Puzzle, left, 8, Ls, Length, NextI).
get_value(Puzzle, left, 9, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,_,_,_,_,_,[A9,B9,C9|_]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A9,B9,C9]),#=,X),
        get_value(Puzzle, left, 9, Ls, Length, NextI).
get_value(Puzzle, right, 1, Values, Length, I):-
        I=<Length,
        Puzzle=[[_,_,_,_,_,_,G1,H1,I1]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G1,H1,I1]),#=,X),
        get_value(Puzzle, right, 1, Ls, Length, NextI).
get_value(Puzzle, right, 2, Values, Length, I):-
        I=<Length,
        Puzzle=[_,
                [_,_,_,_,_,_,G2,H2,I2]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G2,H2,I2]),#=,X),
        get_value(Puzzle, right, 2, Ls, Length, NextI).
get_value(Puzzle, right, 3, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,
                [_,_,_,_,_,_,G3,H3,I3]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G3,H3,I3]),#=,X),
        get_value(Puzzle, right, 3, Ls, Length, NextI).
get_value(Puzzle, right, 4, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,
                [_,_,_,_,_,_,G4,H4,I4]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G4,H4,I4]),#=,X),
        get_value(Puzzle, right, 4, Ls, Length, NextI).
get_value(Puzzle, right, 5, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,_,
                [_,_,_,_,_,_,G5,H5,I5]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G5,H5,I5]),#=,X),
        get_value(Puzzle, right, 5, Ls, Length, NextI).
get_value(Puzzle, right, 6, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,_,_,
                [_,_,_,_,_,_,G6,H6,I6]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G6,H6,I6]),#=,X),
        get_value(Puzzle, right, 6, Ls, Length, NextI).
get_value(Puzzle, right, 7, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,_,_,_,
                [_,_,_,_,_,_,G7,H7,I7]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G7,H7,I7]),#=,X),
        get_value(Puzzle, right, 7, Ls, Length, NextI).
get_value(Puzzle, right, 8, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,_,_,_,_,
                [_,_,_,_,_,_,G8,H8,I8]|_],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G8,H8,I8]),#=,X),
        get_value(Puzzle, right, 8, Ls, Length, NextI).
get_value(Puzzle, right, 9, Values, Length, I):-
        I=<Length,
        Puzzle=[_,_,_,_,_,_,_,_,
                [_,_,_,_,_,_,G9,H9,I9]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G9,H9,I9]),#=,X),
        get_value(Puzzle, right, 9, Ls, Length, NextI).
get_value(Puzzle, down, 1, Values, Length, I):-
        I=<Length, 
        Puzzle=[_,_,_,_,_,_,
                [A7|_],[A8|_],[A9|_]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([A7,A8,A9]),#=,X),
        get_value(Puzzle, down, 1, Ls, Length, NextI).
get_value(Puzzle, down, 2, Values, Length, I):-
        I=<Length, 
        Puzzle=[_,_,_,_,_,_,
                [_,B7|_],[_,B8|_],[_,B9|_]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([B7,B8,B9]),#=,X),
        get_value(Puzzle, down, 2, Ls, Length, NextI).
get_value(Puzzle, down, 3, Values, Length, I):-
        I=<Length, 
        Puzzle=[_,_,_,_,_,_,
                [_,_,C7|_],[_,_,C8|_],[_,_,C9|_]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([C7,C8,C9]),#=,X),
        get_value(Puzzle, down, 3, Ls, Length, NextI).
get_value(Puzzle, down, 4, Values, Length, I):-
        I=<Length, 
        Puzzle=[_,_,_,_,_,_,
                [_,_,_,D7|_],[_,_,_,D8|_],[_,_,_,D9|_]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([D7,D8,D9]),#=,X),
        get_value(Puzzle, down, 4, Ls, Length, NextI).
get_value(Puzzle, down, 5, Values, Length, I):-
        I=<Length, 
        Puzzle=[_,_,_,_,_,_,
                [_,_,_,_,E7|_],[_,_,_,_,E8|_],[_,_,_,_,E9|_]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([E7,E8,E9]),#=,X),
        get_value(Puzzle, down, 5, Ls, Length, NextI).
get_value(Puzzle, down, 6, Values, Length, I):-
        I=<Length, 
        Puzzle=[_,_,_,_,_,_,
                [_,_,_,_,_,F7|_],[_,_,_,_,_,F8|_],[_,_,_,_,_,F9|_]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([F7,F8,F9]),#=,X),
        get_value(Puzzle, down, 6, Ls, Length, NextI).
get_value(Puzzle, down, 7, Values, Length, I):-
        I=<Length, 
        Puzzle=[_,_,_,_,_,_,
                [_,_,_,_,_,_,G7|_],[_,_,_,_,_,_,G8|_],[_,_,_,_,_,_,G9|_]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([G7,G8,G9]),#=,X),
        get_value(Puzzle, down, 7, Ls, Length, NextI).
get_value(Puzzle, down, 8, Values, Length, I):-
        I=<Length, 
        Puzzle=[_,_,_,_,_,_,
                [_,_,_,_,_,_,_,H7|_],[_,_,_,_,_,_,H8|_],[_,_,_,_,_,_,H9|_]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([H7,H8,H9]),#=,X),
        get_value(Puzzle, down, 8, Ls, Length, NextI).
get_value(Puzzle, down, 9, Values, Length, I):-
        I=<Length, 
        Puzzle=[_,_,_,_,_,_,
                [_,_,_,_,_,_,_,_,I7],[_,_,_,_,_,_,_,_,I8],[_,_,_,_,_,_,_,_,I9]],
        Values=[Num|Ls],
        NextI is I+1,
        X in 1..9,
        count(Num,([I7,I8,I9]),#=,X),
        get_value(Puzzle, down, 9, Ls, Length, NextI).
get_value(_,_,_,_,Length,I):- I>Length.
get_value(_,_,_,_,_,_).
