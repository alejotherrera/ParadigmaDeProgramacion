% elector
% elector(matricula, sexo, domicilio, situacion_electoral, mes,a�o)
elector('12458894', 'F', domicilio('Julio A.Roca', 455,1), situacion('En_padron'), 02, 2017).
elector('20589643', 'M', domicilio('Colombia', 630,2), situacion('En_padron'), 02,2017).
elector('29514820', 'M', domicilio('H. Yrigoyen', 1151,2), situacion('En_exterior','N'),04,2017).
elector('27213056', 'F', domicilio('Peru', 2020,1), situacion('En_padron'),04,2017).
elector('11760260', 'F', domicilio('San Martin', 25,3), situacion('Privado_libertad'),01,2017).
elector('20894685', 'F', domicilio('Julio A.Roca', 900,4), situacion('En_padron'),06,2017).
elector('6443895', 'M', domicilio('Liniers', 6399,4), situacion('En_padron'),06,2017).


%localidad/3
%localidad(codigo, nombre, provincia)
localidad(1, 'R�o III', 'CORDOBA').
localidad(2, 'Cosquin', 'CORDOBA').
localidad(3, 'San Miguel', 'TUCUMAN').
localidad(4, 'Resistencia', 'CHACO').

%eleccion/3
%eleccion(tipo, mes, a�o)
eleccion('Nacional', 10, 2017).













