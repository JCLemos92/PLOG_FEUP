%male(X) :- X is male
male(aldo_burrows).
male(lincon_burrows).
male(michael_scofield).
male(lj_burrows).

%female(Y) :- Y is female
female(christina_rose_scofield).
female(lisa_rix).
female(sara_tancredi).
female(ella_scofield).

%parent(X,Y) :- X is parent of Y
parent(lisa_rix,lj_burrows).
parent(lincon_burrows,lj_burrows).
parent(aldo_burrows,lincon_burrows).
parent(christina_rose_scofield,lincon_burrows).
parent(aldo_burrows,michael_scofield).
parent(christina_rose_scofield,michael_scofield).
parent(michael_scofield,ella_scofield).
parent(sara_tancredi,ella_scofield).

%a)
%father(X,Y):- X is Y's father
father(X,Y):-
    male(X),parent(X,Y).

%mother(X,Y):- X is Y's mother
mother(X,Y):-
    female(X),parent(X,Y).

%X and Y are Z's parents
parents(X,Y,Z) :-
    father(X,Z),
    mother(Y,Z).

%b)
%Y is list with X descendants
descendents(X,Y):-
    findall(Y,parent(X,Y),Y).