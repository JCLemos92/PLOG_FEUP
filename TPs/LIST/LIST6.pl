delete_one(X,L,L1):-
    append(La,[X|Lb],L),
    append(La,Lb,L1).

delete_all(X,L1,L2):-
    delete_one(X,L1,L2),
    delete_all(X,L2,_).