abonado(1245,cliente(157456898,'German de la Prueba',5),'G',12,'Y','N').
abonado(1844,cliente(157434584,'Carmen de la Prueba',2),'S',5,'N','N').
abonado(87,cliente(156241789,'Alberto de la Prueba',6),'S',10,'Y','Y').
abonado(5487,cliente(154872563,'Carlos de la Prueba',6),'S',2,'Y','Y').
abonado(48854,cliente(156854963,'Karina de la Prueba',2),'B',1,'Y','Y').
abonado(4874,cliente(155847813,'Juana de la Prueba',6),'Pp',1,'N','N').
abonado(366,cliente(4254789,'Hernan de la Prueba',4),'Pp',5,'N','N').
abonado(4587,cliente(458796,'Martin de la Prueba',1),'B',6,'Y','Y').
abonado(96352,cliente(154789321,'Francisco de la Prueba',3),'G',8,'N','N').
abonado(95825,cliente(154698325,'Pablo de la Prueba',5),'G',4,'Y','N').
abonado(1246,cliente(147856923,'Claudia de la Prueba',1),'S',9,'N','N').
abonado(3257,cliente(155123456,'Natalia de la Prueba',3),'G',6,'N','N').
abonado(6547,cliente(154217582,'Carolina de la Prueba',6),'S',7,'N','N').
abonado(354,cliente(15623489,'Juan de la Prueba',2),'G',2,'N','N').

plan('G','Paquete Gold',458,25,75,85).
plan('S','Paquete Silver',350,27.5,95,105).
plan('B','Paquete Black',750,17.5,0,75).
plan('PP','Prepago',100,35,0,0).

region(1,'Centro').
region(2,'Mesopotamia').
region(3,'Cuyo').
region(4,'Norte').
region(5,'Buenos Aires').
region(6,'Patagonia').

paquetePremiumContratado(1245,['HBO Max HD','FOX+ HD','Adults Pack','NFL']).
paquetePremiumContratado(87,['HBO Max HD','NFL']).
paquetePremiumContratado(5487,['FOX+ HD','NFL']).
paquetePremiumContratado(48854,['HBO Max HD','FOX+ HD','Adults Pack','NFL']).
paquetePremiumContratado(4587,['HBO Max HD','FOX+ HD','Adults Pack','NFL']).
paquetePremiumContratado(95825,['NFL']).

%1)	Calcular la ganancia total obtenida de los abonados de un determinado plan

gananciaTotal(Plan, Total) :- findall(SubTotal,
				      (plan(Plan,_,Cb,CAlq,CPp,CBa),
				       abonado(Codigo,_,Plan,CantAlq,TPp,Tba),
				       paquetePremiumContratado(Codigo,Lista),
				       length(Lista,CantPremium),
				       ((TPp == 'Y', CostoPremium is CPp * CantPremium);
				       (TPp == 'N', CostoPremium is 0)),
				       ((Tba == 'Y', CostoBajadaAdicional is CBa);
				       (Tba == 'N', CostoBajadaAdicional is 0)),
				       SubTotal is Cb + CostoPremium + CostoBajadaAdicional + (CAlq * CantAlq)),
				       Lista),
	                       sumlist(Lista,Total).

%2)	Generar una lista donde cada componente sea la descripcion de la region y el total ganado en esa region

listaGananciasPorRegion(Lista) :- findall((NombreRegion,Total),
					(
					  abonado(Codigo,cliente(_,_,Region),Plan,CantAlq,TPp,Tba),
					  region(Region, NombreRegion),
				          plan(Plan,_,Cb,CAlq,CPp,CBa),
					  paquetePremiumContratado(Codigo,ListaPaquetes),
				          length(ListaPaquetes,CantPremium),
				          ((TPp == 'Y', CostoPremium is CPp * CantPremium);
				          (TPp == 'N', CostoPremium is 0)),
				          ((Tba == 'Y', CostoBajadaAdicional is CBa);
				          (Tba == 'N', CostoBajadaAdicional is 0)),
				          Total is Cb + CostoPremium + CostoBajadaAdicional + (CAlq * CantAlq)
					),
					 Lista).

%3)Listar Codigo de Abonado, Nombre del Cliente, Descripcion de la Region, y Nombre del Plan,
%  de aquellos abonados que posean mas de 2 paquetes premium
%  contratados.
%

listaAbonadosPremium(Codigo, Nombre, Region, Plan) :- abonado(Codigo,cliente(_,Nombre, CR),CP,_,_,_),
	                                               plan(CP,Plan,_,_,_,_),
						       region(CR,Region),
						        paquetePremiumContratado(Codigo,Lista),
							length(Lista,Cantidad),
							Cantidad > 2.

% 4) Obtener el Nombre del Cliente, Descripcion de la Region de aquellos
%    abonados que tengan como paquete premium contratado un valor de
%    referencia pasada por parametro
%
abonadoConPaquetePremium(Paquete, Nombre, Region) :- abonado(Codigo,cliente(_,Nombre,CodReg),_,_,_,_),
	                                             region(CodReg,Region),
						     paquetePremiumContratado(Codigo,Lista),
						     member(Paquete, Lista).
