homem(luis).
homem(miguel).
mulher(cristina).
mulher(sofia).
mulher(ines).
pai(miguel,luis).
pai(miguel,sofia).
filha(sofia,miguel).
filho(ines,cristina).
filho(F,X):-homem(F),pai(X)
pai(P):-pai(P,_).
mae(P):-mae(M,_).
mae(cristina,luis).
mae(cristina,sofia).
mae(cristina,ines).
irma(I1,I2):-mulher(I1),pai(P,I1),pai(P,I2),mae(M,I1),mae(M,I2),I1\=I2.
irmao(I1,I2):-homem(I1),pai(P,I1),pai(P,I2),mae(M,I1),mae(MI2),I1\=I2.
meio_irmao(I1,I2):-homem(I1),pai(P,I1),Pai(P,I2),mae(M1,I1),mae(M1,I2).


