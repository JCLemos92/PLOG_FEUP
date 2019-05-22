/* arvore geneológica
     pai1 0 mae1
          |
   ---------------
   |             |     
pai3 0 mae3   pai2 0 mae2
     |             |
  Miguel          Joana
*/

/* Declarar variáveis */
male('Miguel').
male(pai3).
male(pai2).
male(pai1).
female('Joana').
female(mae3).
female(mae2).
female(mae1).

parent(pai3,'Miguel').
parent(mae3,'Miguel').
parent(pai2,'Joana').
parent(mae2,'Joana').
parent(pai1,pai3).
parent(mae1,pai3).
parent(pai1,pai2).
parent(mae1,pai2).

/* 
Pergunta: Quem são os pais de X?
*/
parents(X,P,M):-parent(P,X),parent(M,X),male(P),female(M).

/*No SICStus:
| ?- parents('Miguel',X,Y).
X = pai3,
Y = mae3 ?
yes
/*