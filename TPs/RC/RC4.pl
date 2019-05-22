comida(peru).
comida(frango).
comida(salmao).
comida(solha).

bebida(vinho_verde).
bebida(cerveja).
bebida(vinho_maduro).

pessoa(ana).
pessoa(antonio).
pessoa(barbara).
pessoa(bruno).

%como não temos nada a restringir associamos tudo a tudo
gosta(Pessoa,Comida):-
    pessoa(Pessoa),
    comida(Comida).
gosta(Pessoa,Bebida):-
    pessoa(Pessoa),
    bebida(Bebida).

casado(X,Y):-
    pessoa(X),
    pessoa(Y). % #aceitam-se paneleirices

combina(Prato,Bebida):-
    comida(Prato),
    bebida(Bebida).

%como está tudo ligado vai dizer yes a tudo assim não tem piada
a:- casado(ana,bruno),
    gosta(ana,vinho_verde),
    gosta(bruno,vinho_verde).

b(Bebida):- combina(salmao,Bebida).

c(Comida):- findall(Comida, combina(Comida,vinho_verde), Comida).

%Se com os argumentos acima fizesse frases como deve ser chegariamos a respostas restritas
