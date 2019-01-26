%vou preencher de forma a haver respostas às perguntas

homem(joao).
mulher(maria).
mulher(ana).

animal(cao).
animal(gato).
animal(tigre).

jogo(xadrez).
jogo(damas).

desporto(tenis).
desporto(natacao).

mora_em(joao,casa).
mora_em(maria,casa).
mora_em(ana,apartamento).

gosta_de(ana,gato).
gosta_de(joao,natacao).
gosta_de(joao,xadrez).
gosta_de(ana,tenis).
gosta_de(ana,tigres).

a(Pessoa):-
    mora_em(Pessoa,apartamento),
    gosta_de(Pessoa,X),
    animal(X).

b:- mora_em(joao,casa),
    mora_em(maria,casa),
    gosta_de(joao,X),
    gosta_de(ana,Y),
    desporto(X),
    desporto(Y). %correr b. dá yes

c(Pessoa):- 
    gosta_de(Pessoa,Desporto),
    gosta_de(Pessoa,Jogo),
    desporto(Desporto),
    jogo(Jogo).

d:- mulher(Y),
    gosta_de(Y,tenis),
    gosta_de(Y,tigres).