%FECHADURA
%A comb. de uma fechadura é composta por 3 numeros entre 1 e 50.
%O 2º numero é o dobr do primeiro
%O terceiro numero é igual ao segundo mais 10
%A soma dos dois primeiros é maior que 10.
%O primeiro n tem um digito par e outro impar. 
%O segundo tem ou ambos par ou ambos impar

:-use_module(library(clpfd)).

fechadura(Vars):-
    %A comb. de uma fechadura é composta por 3 numeros entre 1 e 50.
    Vars=[A,B,C],
    domain(Vars, 1, 50), domain([A2,B2],0,9), domain([A1,B1],0,5),
    %O 2º numero é o dobr do primeiro
    B #= A*2,
    %O terceiro numero é igual ao segundo mais 10
    C #= B+10,
    %A soma dos dois primeiros é maior que 10.
    A+B #> 10,
    %O primeiro n tem um digito par e outro impar.
    A #= 10*A1 + A2,
    A1 mod 2 #\= A2 mod 2,
    %O segundo tem ou ambos par ou ambos impar
    B #= 10*B1 + B2,
    B1 mod 2 #= B2 mod 2,
    labeling([ffc],Vars).

