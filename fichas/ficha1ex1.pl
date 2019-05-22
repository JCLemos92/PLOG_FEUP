%Exercicio1

male(aldo_burrows).
male(lincoln_burrows).
male(lj_burrows).
male(michael_scofield).

female(lisa_rix).
female(ella_scofield).
female(christina_rosa).
female(sara_tancredi).

parent(aldo_burrows,lincoln_burrows).
parent(christina_rosa,lincoln_burrows).
parent(aldo_burrows,michael_scofield).
parent(christina_rosa,michael_scofield).
parent(michael_scofield,ella_scofield).
parent(sara_tancredi,ella_scofield).
parent(lisa_rix,lj_burrows).
parent(lincoln_burrows,lj_burrows).


father(X,Y):-
	male(X),
	parent(X,Y).

mother(X,Y):-
	female(X),
	parent(X,Y).

%Exercicio 5



%Exercicio 6

gato(silvester).
passaro(tweety).
peixe(goldie).
minhoca(molie).

gosta(X,Y):- gato(X), passaro(Y).
gosta(X,Y):- gato(X), peixe(Y).
gosta(X,Y):- passaro(X), minhoca(Y).

%amigos(X,Y):- gosta(X,Y).
come(X,Y):- gosta(X,Y).

%Exercicio8

%alinea a)
%X = engenheiro
%Y = supervisor

%alinea b)
%nao retorna nada porque nao ha a ivone nao e engenheira

%alinea c)
%luis, pois e a primeira pessoa com cargo de supervisor
%aparece duas vezes porque temos uma dijuncao

%alinea d)
% J = engenheiro, visto que e o unico chefiado por supervisor (segunda clausola da disjuncao)
% P = enhenheiro porque o primeiro cargo com enhenheiro e o daniel

%alinea e)
%supervisor_chefe porque e o primeiro cargo de supervisor_chefe que aparece que n e a carolina
%supervisor_exec porque tambem e chefiado por um dirtector e segue os mesmos padroes do primeiro resultado
cargo(tecnico, rogerio).
cargo(tecnico, ivone).
cargo(engenheiro, daniel).
cargo(engenheiro, isabel).
cargo(engenheiro, oscar).
cargo(engenheiro, tomas).
cargo(engenheiro, ana).
cargo(supervisor, luis).
cargo(supervisor_chefe, sonia).
cargo(secretaria_exec, laura).
cargo(diretor, santiago).
chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, director).
chefiado_por(secretaria_exec, director).

%Exercicio9

aluno(joao, paradigmas).
aluno(maria, paradigmas).
aluno(joel, lab2).
aluno(joel, estruturas).
frequenta(joao, feup).
frequenta(maria, feup).
frequenta(joel, ist).
professor(carlos, paradigmas).
professor(ana_paula, estruturas).
professor(pedro, lab2).
funcionario(pedro, ist).
funcionario(ana_paula, feup).
funcionario(carlos, feup).

%alinea a
alunos(X,Z):-
	professor(X,Y),
	aluno(Z,Y).

%alinea b
universidade(X):-
	frequenta(X,feup).


%duarte valente.
%alinea c
%colega de disciplina
colega(X,Z):-
	aluno(X,Y),
	aluno(Z,Y),
	X \= Z.

%colega de universidade
colega(X,Z):-
	frequenta(X,Y),
	frequenta(Z,Y),
	X \= Z.

%colega se professor
colega(X,Z):-
	funcionario(X,Y),
	funcionario(Z,Y),
	X \= Z.


%exercicio 10.
comprou(joao, honda).
comprou(joao, uno).
ano(honda, 1997).
ano(uno, 1998).
valor(honda, 20000).
valor(uno, 7000).

pode_vender(Pessoa,Carro,Ano):-
	comprou(Pessoa,Carro),
	ano(Carro,Z),
	X is Ano - Z,
	X < 10,
	valor(Carro,Y),
	Y < 10000.




	
