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

%a)
a(X, Aluno):-
    professor(X, Cadeira),
    aluno(Aluno, Cadeira).

% outra solução
alunos_de(X):-
    professor(X,Cadeira),
    findall(Aluno,aluno(Aluno,Cadeira),Y),
    write(Y).

%b
b(X, Pessoa):-
    frequenta(Pessoa, X);
    funcionario(Pessoa,X).

c(P1,P2):-
    aluno(P1,Cad), aluno(P2,Cad);
    frequenta(P1,Fac),frequenta(P2,Fac);
    professor(P1,_),professor(P2,_),
    funcionario(P1, Fac), funcionario(P2,Fac).
