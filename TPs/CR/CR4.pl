factorial(0, Valor):-
    Valor is 1.
factorial(N, Valor):-
    N > 0,
    N_next is N-1,
    factorial(N_next, V_next),
    Valor is V_next*N.
factorial(_,_).

fibonacci(N):-
    fstline(N,0),
    scdline(N,0).

fstline(N,0):-
    write('N    '),
    write(0),
    write('     '),
    fstline(N,1).
fstline(N,N):- write(N),nl.
fstline(N,Num):-
    write(Num),
    write('     '),
    Next_Num is Num + 1,
    fstline(N,Next_Num).

scdline(N,0):-
    write('Fib. '),
    write(1),
    write('     '),
    write(1),
    write('     '),
    fib(N,1,1,2).
fib(N,Num1,Num2,N):-
    Num is Num1+Num2,
    write(Num),nl.
fib(N,Num1,Num2,I):-
    Num is Num1+Num2,
    write(Num),
    write('     '),
    NextI is I+1,
    fib(N, Num2, Num, NextI).
