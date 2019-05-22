piloto(bensenyei).
piloto(lamb).
piloto(chambliss).
piloto(maclean).
piloto(mangold).
piloto(jones).
piloto(bonhomme).

team(lamb,breitling).
team(bensenyei,red_bull).
team(chambliss,red_bull).
team(maclean,mediterranean_racing_team).
team(mangold,cobra).
team(jones,matador).
team(bonhomme,matador).
aviao(mx2).
aviao(edge540).
circuito(istambul).
circuito(budapest).
circuito(porto).
vencedor(jones,porto).
vencedor(mangold,budapest).
vencedor(mangold,istambul).


vencedor_circuito(P,C):-piloto(P),vencedor(P,C). 
team_winner(C):-vencedor_circuito(P,C), team(P,T).

