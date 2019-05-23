child(martha,charlotte). 
child(charlotte,caroline). 
child(caroline,laura). 
child(laura,rose). 
    
descend(X,Y):-child(X,Y). 

descend(X,Y):-
    child(X,Z), 
    descend(Z,Y).

fromMartha(X):-
    descend(martha,X).
fromMartha(_).

%_______________________
%
%        FINDALL
%
%_______________________

ex1:- 
    findall(X,descend(martha,X),Z),
    write('X = '), write(X),nl,
    write('Z = '), write(Z),nl.

ex2:- 
    findall(fromMartha(X), descend(martha,X),Z),
    write('X = '), write(X),nl,
    write('Z = '), write(Z),nl.

ex3:-
    findall(X,descend(mary,X),Z),
    write('X = '), write(X),nl,
    write('Z = '), write(Z),nl.

%_______________________
%
%        BAGOF
%
%_______________________

ex4:-
    %Mother = martha,
    bagof(Child,descend(Mother,Child),List),
    write('Child = '), write(Child),nl,
    write('Mother = '), write(Mother),nl,
    write('List = '), write(List).

ex5:-
    findall(List,bagof(Child,descend(_,Child),List),Z),
    write(Z).

%_______________________
%
%        SETOF
%
%_______________________

age(harry,13). 
age(draco,14). 
age(ron,13). 
age(hermione,13). 
age(dumbledore,60). 
age(hagrid,30).
    
ex6:-
    findall(X,age(X,Y),Out),
    write('Unordered List: '), write(Out), nl,
    setof(X,Y^age(X,Y),OOut),
    write('Ordered List: '), write(OOut). 