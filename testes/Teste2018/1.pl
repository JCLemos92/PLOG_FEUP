%airport(Name, ICAO, Country).
airport('Aeroporto Francisco Sá Carneiro', 'LPPR', 'Portugal').
airport('Aeroporto Humberto Delgado', 'LPPT', 'Portugal').
airport('Aeropuerto Adolfo Suárez Madrid-Barajas', 'LEMD', 'Spain').
airport('Aéroport de Paris-Charles-de-Gaulle Roissy Airport', 'LFPG', 'France').
airport('Aeroporto Internazionale di Roma-Fiumicino - Leonardo da Vinci', 'LIRF', 'Italy').

%company(ICAO, Name, Year, Country).
company('TAP', 'TAP Air Portugal', 1945, 'Portugal').
company('RYR', 'Ryanair', 1984, 'Ireland').
company('AFR', 'Société Air France, S.A.', 1933, 'France').
company('BAW', 'British Airways', 1974, 'United Kingdom').

%flight(Designation, Origin, Destination, DepartureTime, Duration, Company).
flight('TP1923', 'LPPR', 'LPPT', 1115, 55, 'TAP').
flight('TP1968', 'LPPT', 'LPPR', 2235, 55, 'TAP').
flight('TP842', 'LPPT', 'LIRF', 1450, 195, 'TAP').
flight('TP843', 'LIRF', 'LPPT', 1935, 195, 'TAP').
flight('FR5483', 'LPPR', 'LEMD', 630, 105, 'RYR').
flight('FR5484', 'LEMD', 'LPPR', 1935, 105, 'RYR').
flight('AF1024', 'LFPG', 'LPPT', 940, 155, 'AFR').
flight('AF1025', 'LPPT', 'LFPG', 1310, 155, 'AFR').

%short(+Flight)
short(Flight):-
	flight(Flight,_,_,_,Duration,_),
	Duration < 120.

%longer(+Flight1, +Flight2, -LongerFlight)
longer(Flight1, Flight2, LongerFlight):-
	flight(Flight1,_,_,_,D1,_),
	flight(Flight2,_,_,_,D2,_),
	D1 > D2,
	LongerFlight = Flight1.

longer(Flight1, Flight2, LongerFlight):-
	flight(Flight1,_,_,_,D1,_),
	flight(Flight2,_,_,_,D2,_),
	D2 > D1,
	LongerFlight = Flight2.

%Case Minutes over 60
arrivalTime(Flight, ArrivalTime):-
	flight(Flight,_,_,DepartureTime,Duration,_),
	Time is DepartureTime + Duration,
	Hours is Time // 100,
	Aux is Hours * 100,
	Minutes is Time - Aux,
	Minutes > 60,
	Hours2 is Hours + 1,
	Minutes2 is Minutes-60,
	Aux2 is Hours2 * 100,
	ArrivalTime is Aux2 + Minutes2.

%Case minutes under 60
arrivalTime(Flight, ArrivalTime):-
	flight(Flight,_,_,DepartureTime,Duration,_),
	Time is DepartureTime + Duration,
	Hours is Time // 100,
	Aux is Hours * 100,
	Minutes is Time - Aux,
	Minutes < 60,
	Hours2 is Hours,
	Minutes2 is Minutes,
	Aux2 is Hours2 * 100,
	ArrivalTime is Aux2 + Minutes2.

not_member(_, []) :- !.
not_member(X, [Head|Tail]) :-
     X \= Head,
    not_member(X, Tail).

countries(Company, ListOfCountries):-
	flight(_,Origin,Destination,_,_,Company),
	airport(_,Origin,Country1),
    airport(_,Destination,Country2),
    insert_Country(ListOfCountries,Country1,Country2),write(ListOfCountries).
	%nonmember([Country1], ListOfCountries),
	%nonmember([Country2], ListOfCountries),


%insert_Country(List,Country,Country):-
%    not_member(Country,List),
%    append(_,Country,List).
insert_Country(List,Country1,Country2):-
    not_member(Country1,List),
    not_member(Country2,List),
    append(Country2,Country1,List).
insert_Country(List,Country,_):-
    not_member(Country,List),
    append(_,Country,List).
insert_Country(List,_,Country):-
    not_member(Country,List),
    append(_,Country,List).
insert_Country(_,_,_).