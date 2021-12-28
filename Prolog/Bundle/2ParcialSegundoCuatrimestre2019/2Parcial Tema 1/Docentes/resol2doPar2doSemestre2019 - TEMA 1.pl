%Nicolás Colacioppo

%HECHOS.
promo('AAA','Cargando 10 litros o más de cualquier combustible, descuento del 8%',10,8).
promo('BBB','Cargando 8 litros o más de cualquier combustible, descuento del 5%',8,5).
promo('CCC','Cargando 12 litros o más de cualquier combustible, descuento del 10%',12,10).

venta('V1','AAA',fecha(29,9,2019),'1',12.5).
venta('V2','BBB',fecha(16,10,2019),'2',10.0).
venta('V3','AAA',fecha(16,10,2019),'4',15.5).
venta('V4','AAA',fecha(18,10,2019),'8',8.0).
venta('V5','CCC',fecha(18,10,2019),'9',12.0).


combustible('A','súper',45.67,['1','2','3']).
combustible('B','premium',52.97,['4','5']).
combustible('C','diésel',44.69,['6']).
combustible('D','diésel premium',50.84,['7']).
combustible('E','GNC',20.99,['8','9','0']).


%REGLAS.
regla1(CV,SloganPromo,Mes,Año):-venta(CV,CP,fecha(_,Mes,Año),_,CantL),CantL > 12, promo(CP,SloganPromo,_,_).


regla2(CV,PorcDes):-venta(CV,CP,_,_,CantL),promo(CP,_,Desde,X),
	          ((CantL>=Desde,PorcDes is X,!);(CantL < Desde,PorcDes is 0,!)).


regla3(NomCombus,ListaOrd):-findall(CV,(venta(CV,_,_,CSur,_),combustible(_,NomCombus,_,LSur),member(CSur,LSur)),Lista),
	                    sort(Lista,ListaOrd).
















