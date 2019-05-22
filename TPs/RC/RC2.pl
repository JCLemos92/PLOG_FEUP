:-use_module(library(lists)).

driver(lamb).
driver(besenyi).
driver(chambliss).
driver(maclean).
driver(mangold).
driver(jones).
driver(bonhomme).

team(breitling).
team(red_bull).
team(mediterranean_racing_team).
team(cobra).
team(matador).

racer_for(lamb,breitling).
racer_for(besenyi,red_bull).
racer_for(chambliss,red_bull).
racer_for(maclean,mediterranean_racing_team).
racer_for(mangold,cobra).
racer_for(jones,matador).
racer_for(bonhomme,matador).

plane(mx2).
plane(edge540).

plane(lamb,mx2).
plane(besenyi,edge540).
plane(chambliss,edge540).
plane(maclean,edge540).
plane(mangold,edge540).
plane(jones,edge540).
plane(bonhomme,edge540).

track(istambul).
track(budapest).
track(porto).

winner(jones,porto).
winner(mangold,budapest).
winner(mangold,istambul).

gates(istambul,9).
gates(budapest,6).
gates(porto,5).

winner_team(Team,Race):-
    racer_for(Racer,Team),
    winner(Racer,Race).

%a) winner(Racer,porto).
%b) winner_team(Team,porto).

%c)
c:- driver(Racer),
    findall(Race,winner(Racer,Race),X),
    length(X, Int),
    Int > 1,
    write(Racer).
    
d:- gates(Track,Gates),
    Gates > 8,
    findall(Gates,gates(Track,Gates),_),
    write(Track).

e(Racer):- plane(Racer,Plane),
    Plane \= edge540.