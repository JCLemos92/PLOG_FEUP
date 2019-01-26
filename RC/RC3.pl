book(os_maias).

author(eca_de_queiros).

nacionality(portuguese).
nacionality(english).
nacionality(eca_de_queiros,portuguese).

wrote(eca_de_queiros,os_maias).

genre(fiction).
genre(romance).
genre(os_maias,romance).
genre(os_maias,fiction).

%a) wrote(Writer,os_maias).

%b(Author,romance).
b(Author,Genre):-
    nacionality(Author,portuguese),
    wrote(Author,Book),
    genre(Book,Genre).

c(Author):-
    b(Author,fiction),
    b(Author,X),
    X \= fiction.