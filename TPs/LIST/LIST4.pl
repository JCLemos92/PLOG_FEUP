inverter(L1,L2):-
    inverter(L1,[],L2).

inverter([H|T],Aux,L2):-
    inverter(T,[H|Aux],L2).

inverter([],L2,L2).