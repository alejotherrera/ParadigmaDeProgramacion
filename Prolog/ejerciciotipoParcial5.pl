%Hechos+Reglas=Base de conocimiento
cursa('Perez Juan','2k6').
cursa('Tolaba Marina','2k5').
cursa('Torrez Fabian','2k6').
cursa('Martinez Carla','2k3').
cursa('Barrera Laura','2k5').
aprobo('Perez Juan',8).
aprobo('Martinez Carla',9).
aprobo('Barrera Laura',7).
reprobo('Tolaba Marina',2).
reprobo('Torrez Fabian',3).

%Reglas l�gicas..
%alumno_cursa/1
alumno_cursa(X) :- cursa(X,_).

% Regla que informe: nombre de los estudiantes que aprobaron con nota
% mayor igual a 8. regla2/1
regla2(X):-aprobo(X,N),N>=8.