comprou(joao, honda).
ano(honda, 1997). 
comprou(joao, uno).
ano(uno, 1998).
valor(honda, 20000).
valor(uno, 7000). 

pode_vender(Pessoa,Carro,Ano_act):-
    %a pessoa é dona do carro
    comprou(Pessoa,Carro),
    %valor menos que 10000
    valor(Carro, Val),
    Val < 10000,
    %carro comprado nos ultimos 10 anos
    ano(Carro,Ano_compra),
    Aux is (Ano_act-Ano_compra),
    Aux =< 10.
