male(aldo).
male(lincon).
male(lj).
male(michael).
female(christina).
female(lisa).
female(sara).
female(ella).

parent(aldo,lincon).
parent(christina,lincon).
parent(aldo,michael).
parent(christina,michael).
parent(lisa,lj).
parent(lincon,lj).
parent(michael,ella).
parent(sara,ella).

/* RC1 */
father(A,B):-parent(A,B),male(A).

/* RC2 */
son(B,A):-parent(A,B),male(B).

male/1.
female/1.
parent/2.
father/2. 
son/2.