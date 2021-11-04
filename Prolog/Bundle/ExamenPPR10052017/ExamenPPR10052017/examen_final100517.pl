%sospechoso(Nombre, Apellido, Apodo,[Delitos],carcel(Anios)).
sospechoso('Roger', 'Kint', 'Verbal', [1,4], alcatraz(1)).
sospechoso('Keyser', 'Soze', '', [1,3,5], detroit(3)).
sospechoso('Arkosh', 'Kovash', '', [3,5,4], detroit(7)).
sospechoso('Dean', 'Keaton', '', [1], alcatraz(5)).
sospechoso('Michael', 'McManus', 'Baldwin', [5,6], detroit(10)).
sospechoso('Fred', 'Fenster', 'Toro', [2,3,6], alcatraz(15)).
sospechoso('Todd', 'Hockney', 'Pollack', [4], detroit(5)).

%delito(Codigo, Nombre, Anios_pena).
delito(1,'Estafa', 1).
delito(2,'Robo a mano armada', 2).
delito(3,'Hurto', 2).
delito(4,'Secuestro de blindado', 5).
delito(5,'Robo de objectos de arte', 5).
delito(6,'Venta de artículos robados', 3).

punto1:- sospechoso(X, Y,_, L, _), delito(D, 'Secuestro de blindado', _), member(D,L), write(Y), write(','), write(X), nl, fail.
punto2(X,Y):- sospechoso(X, Y,_,L, detroit(A)), A>5, length(L, T), T=<2.
punto3(L):- findall(X, (sospechoso(_,X,_,Delitos,_), punto2(_,X), not(member(1,Delitos))), L).



