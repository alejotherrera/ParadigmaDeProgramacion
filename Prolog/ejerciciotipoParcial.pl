%Hechos+Reglas=Base de conocimiento
aspirantes(30000000,lara,pointer,11111,domicilio('suipacha',250)).
aspirantes(35000000,tina,jolie,22222,domicilio('sanmartín',101)).
aspirantes(25000000,paty,pérez,44444,domicilio('rivadavia',1321)).
asiparntes(20000000,matilde,smith,99999,domicilio('9deJulio',2123)).

evaluacion(1,30000000,fecha(12,5,2019), [a,b,c], [10, 15, 20]).
evaluacion(2,20000000,fecha(12,5,2019),[b,c],[12,15]).
evaluacion(3,30000000,fecha(19,5,2019), [e,e] ,[19, 18]).
evaluacion(4,20000000,fecha(19,5,2019),[a,d,e], [6, 15, 12]).
evaluacion(5,30000000,fecha(1,6,2019), [f] ,[15]).

item(a,'uniforme',10).
item(b,'trabajo colaborativo',15).
item(c,'cumplimiento de tareas', 20).
item(d,'compañerismo',20).
item(e,'idioma inglés',20).
item(f,'idioma portugués',15).

%regla1
regla1(X,Y):-(item(_,_,N),((X>=N);N>=Y)).
%regla2
regla2(X,Ape,Nom,Calle,Altura):-evaluacion(X,D,fecha(_,_,_),_,_),aspirantes(D,Nom,Ape,_,domicilio(Calle,Altura)).
%regla3(ISSUE)
regla3(X,Y,L):-findall(D,(evaluacion(_,D,fecha(_,Mes,Año),_,_),(Mes>=X),(Y>=Año)),L).
