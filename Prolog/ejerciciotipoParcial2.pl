%Hechos+Reglas=Base de conocimiento
servicios(1, 1, 7, fecha(12, 9, 2015), 300).
servicios(2, 2, 5,fecha( 14 ,9 ,2015), 150).
servicios(3, 2, 6, fecha(17, 9, 2015), 350).
servicios(4, 1, 5,fecha( 21, 9, 2015), 400).
servicios(5, 2, 2, fecha(21, 9, 2015), 250).
servicios(6, 2, 2, fecha(22, 9, 2015), 300).

tipo(1, consultor�a).
tipo(2, capacitaci�n).

%regla1
regla1(X,Y):-findall(C,(servicios(C,_,_,fecha(_,M,A),Monto),Monto>X,M=9,A=2015),Y).
%regla2
regla2(T):-findall(C,(servicios(C,_,_,fecha(Dia,Mes,A�o),_),Dia=<15,Mes=9,A�o=2015),L),length(L,T).

