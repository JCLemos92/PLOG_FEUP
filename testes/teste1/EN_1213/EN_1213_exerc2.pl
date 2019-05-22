:-use_module(library(lists)).

%nascimento(IdPessoa,IdMãe,Data)

nascimento(3,1,data(2016, 1, 21)).
nascimento(31,1,data(1993,03,01)).
nascimento(32,1,data(1993,03,01)).
nascimento(33,3,data(1993,03,03)).
nascimento(34,3,data(1993,03,03)).
nascimento(35,5,data(1993,03,05)).
nascimento(21,1,data(1992,02,01)).
nascimento(22,1,data(1992,02,01)).
nascimento(23,3,data(1992,02,03)).
nascimento(24,3,data(1992,02,03)).
nascimento(25,5,data(1992,02,05)).
nascimento(11,1,data(1991,01,01)).
nascimento(12,1,data(1991,01,01)).
nascimento(13,3,data(1991,01,03)).
nascimento(14,3,data(1991,01,03)).
nascimento(15,5,data(1991,01,05)).

%óbito(IdPessoa,Data)
obito(3,data(1992,12,03)).
obito(2,data(1991,12,02)).
obito(4,data(1993,12,03)).
obito(1,data(1990,12,01)).

%casamento(IdConjuge1,IdConjuge2,Data)
casamento(1,2,data(2,2,2013)).
casamento(4,5,data(3,2,2013)).
casamento(3,6,data(1990,01,01)).

%divórcio(IdPessoa1,IdPessoa2,Data)
divorcio(1,2,data(3,2,2013)).
divorcio(3,4,data(1991,01,01)).

%imigrou(IdPessoa,Data)
imigrou(1,data(1990,01,01)).
imigrou(2,data(1990,01,01)).
imigrou(3,data(1990,01,03)).
imigrou(4,data(1990,01,03)).
imigrou(5,data(1990,01,05)).

%Pergunta 2 a)--------------------------------------------------------
quantidade_de_registos_de_nascimento(N):-
	findall(_,nascimento(_,_,_),Nasc),
	lengh(Nasc,N).


%Pergunta 2 b)--------------------------------------------------------
primeiro_nativo(IdPessoa):-
	findall(Data-IdPessoa,nascimento(IdPessoa,_,Data),Lista),
	sort(Lista,Ordenada),
	nth1(1,Ordenada,Data-IdPessoa).

%Pergunta 2 c)--------------------------------------------------------
populacao_total(Data,Qtd):-
	findall(IdPessoa, ((nascimento(IdPessoa, _, Data1); imigrou(IdPessoa, Data1)), (\+ obito(IdPessoa, _); (obito(IdPessoa, Data2), data_maior(Data2, Data))), data_maior(Data, Data1)), List),
	lengh(List,Qtd).

data_maior(Data1, Data2):-
	L1 = [Data1, Data2],
	sort(L1, L2),
	nth0(1, L2, Data1).


%Pergunta 2 d)--------------------------------------------------------
maes_solteiras(Lista):-
 findall(IdPessoa, (nascimento(_, IdPessoa, data(Year, _, _)), (2016 - Year < 18), (\+ (casamento(IdPessoa, _, _) ; casamento(_, IdPessoa, _)) ; (divorcio(IdPessoa, _, _); divorcio(_, IdPessoa, _)))), Lista).