:- use_module(library(lists)).

%sequela(Título,Id,Tipo)
sequela('The Lord of the Rings',1,'fantasia').
sequela('Batman',2,'ficção científica').

% filme(IdSequela,Subtítulo,Ano,Personagens_e_Atores).
filme(1,'The Fellowship of the Ring',2001,[aragorn-'Viggo Mortensen',frodo-'Elijah Wood']).
filme(1,'The Two Towers',2002,[aragorn-'Viggo Mortensen',gandalf-'Ian McKellen']).
filme(1,'The Return of the King',2003,[aragorn-'Viggo Mortensen',frodo-'Elijah Wood']).
filme(2,'-',1989,[batman-'Michael Keaton',joker-'Jack Nicholson']).
filme(2,'Batman Returns',1992,[batman-'Michael Keaton',catwoman-'Michelle Pfeiffer']).
filme(2,'Batman Forever',1995,[batman-'Val Kilmer',robin-'Chris ODonnell',riddler-'Jim Carrey']).


%Pergunta 1 a)--------------------------------------------------
filme_de(Seq,Sub,Ano):-
	sequela(Seq,Id,_),
	filme(Id,Sub,Ano,_).


%Pergunta 1 b)--------------------------------------------------
entrou_na_sequela(Ator,Seq):-
	filme(SeqID,_,_,Atores),
	member(_-Ator,Atores),
	sequela(Seq,SeqID,_).

%Pergunta 1 c)--------------------------------------------------
atores(SubTitulo,Atores):-
	filme(_,SubTitulo,_,ListaAtores),
	selecionaActores(ListaAtores,Atores).

selecionaActores([],[]).
selecionaActores([_-Actor|Resto], [Actor|RestoActores]):-
	selecionaActores(Resto,RestoActores).

%Pergunta 1 d)-----------------Nao esta bem---------------------
manteve_ator(Sequela,Personagem):-
	sequela(Sequela,ID,_),
	filme(ID,Sub1,_,Pers_Atores1),
	member(Personagem-Ator1,Pers_Atores1),
	filme(ID,Sub2,_,Pers_Atores2),
	Sub1 \= Sub2,
	member(Personagem-Ator2,Pers_Atores2),
	Ator1 = Ator2.

manteve_ator(Sequela,Personagem):-
	sequela(Sequela,ID,_),
	filme(ID,_,_,Pers_Atores1),
	\+ member(Personagem-_,Pers_Atores1).

%Pergunta 1 e)--------------------------------------------------
mostra_sequela(Sequela):-
	sequela(Sequela,ID,Cat),
	findall(ID-Sub-Ano-Lista,(sequela(Sequela,ID,Cat),filme(ID,Sub,Ano,Lista)),Filmes),
	write(Sequela),write(' ('),write(Cat),write(')'),nl,write('   '),
	writeFilmInfo(Filmes),nl.

writeFilmInfo([]).
writeFilmInfo([_-Sub-Ano-Lista|Tail]):-	
	write(Sub),write(' ('),write(Ano),write(')'),nl,write('   '),
	writeLista(Lista),
	writeFilmInfo(Tail).

writeLista([]).
writeLista([Personagem-Ator|Tail]):-
	write('   '),write(Personagem),write(': '),write(Ator),nl,write('   '),
	writeLista(Tail).

%Pergunta 2 a)--------------------------------------------------
