%HECHOS.

promo(111,'Cargando 10 litros o m�s de cualquier combustible, descuento del 8%',10,8).
promo(222,'Cargando 8 litros o m�s de cualquier combustible, descuento del 5%',8,5).
promo(333,'Cargando 12 litros o m�s de cualquier combustible, descuento del 10%',12,10).

venta(1,111,fecha(29,9,2019),'A',12.5).
venta(2,222,fecha(16,10,2019),'B',10.0).
venta(3,111,fecha(16,10,2019),'D',15.5).
venta(4,111,fecha(18,10,2019),'H',8.0).
venta(5,333,fecha(18,10,2019),'I',12.0).

combustible(1,'s�per',45.67,['A','B','C']).
combustible(2,'premium',52.97,['D','E']).
combustible(3,'di�sel',44.69,['F']).
combustible(4,'di�sel premium',50.84,['G']).
combustible(5,'GNC',20.99,['H','I','J']).



%REGLAS.
