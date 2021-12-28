% elector/5
% elector(matricula, sexo, domicilio, situacion_electoral, mes_novedad,año_novedad)
elector('12458894', 'F', domicilio('Julio A.Roca', 455,1), situacion('En_padron'), 02, 2017).
elector('20589643', 'M', domicilio('Colombia', 630,2), situacion('En_padron'), 02,2017).
elector('29514820', 'M', domicilio('H. Yrigoyen', 1151,2), situacion('En_exterior','N'),04,2017).
elector('27213056', 'F', domicilio('Peru', 2020,1), situacion('En_padron'),04,2017).
elector('11760260', 'F', domicilio('San Martin', 25,3), situacion('Privado_libertad'),01,2017).
elector('20894685', 'F', domicilio('Julio A.Roca', 900,4), situacion('En_padron'),06,2017).
elector('6443895', 'M', domicilio('Liniers', 6399,4), situacion('En_padron'),06,2017).

%localidad/3
%localidad(codigo, nombre, provincia)
localidad(1, 'Río III', 'CORDOBA').
localidad(2, 'Cosquin', 'CORDOBA').
localidad(3, 'San Miguel', 'TUCUMAN').
localidad(4, 'Resistencia', 'CHACO').

%eleccion/3
%eleccion(tipo, mes, año)
eleccion('Nacional', 10, 2017).

% Punto1: quienes son los votantes de la eleccion nacional?
% Mostrar: Matricula, sexo, localidad, provincia

punto1(M, S, L, P):- (elector(M, S, domicilio(_,_,LOC), situacion('En_padron'), MES,2017);
		     elector(M, S, domicilio(_,_,LOC), situacion('En_exterior', 'S'), MES,2017)),
	             eleccion(_, ME,2017), ME-MES>=6, localidad(LOC, L, P).


% Punto2: Dados una matrícula y sexo de un elector determinar si vota
% en la elección nacional.
% Mostrar mensaje: 'Elector en padrón' o 'Elector fuera de padrón', según
% corresponda. [15 pts]
punto2(MAT, SEXO):-(punto1(MAT, SEXO,_,_), write('Elector en Padrón'));
(not(punto1(MAT, SEXO,_,_)), write('Elector fuera de Padrón')).

% Punto 3: Crear una lista con las matrículas de los votantes de la
% elección nacional de una determinada provincia.[15 pts]
punto4(Lista, Prov):-findall(Mat,punto1(Mat,_,_,Prov), Lista).












