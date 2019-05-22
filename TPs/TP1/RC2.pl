pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(maclean).
pilot(mangold).
pilot(jones).
pliot(bonhomme).

team(lamb,breitling).
team(besenyei,redbull).
team(chambliss,redbull).
team(maclean,mrt).
team(mangold,cobra).
team(jones,matador).
team(bonhomme,matador).

plane(lamb,mx2).
plane(nesemyei,edge540).
plane(chambliss,edge540).
plane(maclean,edge540).
plane(mangold,edge540).
plane(jones,edge540).
plane(bonhomme,edge540).

circuit(istambul).
circuit(budapest).
circuit(porto).

winner(jones,porto).
winner(mangold,budapest).
winner(mangold,istambul).

gates(istambul,9).
gates(budapest,6).
gates(porto,5).

winnerteam(A,B):-circuit(B),winner(C,B),team(C,A).

pilot/1.
team/2.
plane/2.
circuit/1.
winner/2.
gates/2.
winnerteam/2.

/*Perguntas
a) | ?- winner(X,porto).
b) | ?- winnerteam(X,porto).
c) ainda não conseguimos contar em prolog por isso vamos ver se ganhou pelomenos 2
   | ?- winner(X,Y),winner(X,Z),Y\=Z.
d) | ?- gates(X,Y),Y>=8.
e) | ?- plane(X,Y),Y\=edge420.
*/  