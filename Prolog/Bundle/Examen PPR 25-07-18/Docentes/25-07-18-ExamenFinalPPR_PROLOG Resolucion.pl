%hechos
venta(125,vendedor('Jos� Prado',1),detalleVenta(1,5,20)).
venta(365,vendedor('Marcela Carrasco',2),detalleVenta(5,5,80)).
venta(125,vendedor('Jos� Prado',1),detalleVenta(4,3,20)).
venta(4874,vendedor('Mario Torrez',3),detalleVenta(1,2,60)).
venta(365,vendedor('Marcela Carrasco',2),detalleVenta(3,3,80)).
venta(4874,vendedor('Mario Torrez',3),detalleVenta(3,3,60)).
venta(471,vendedor('Mario Torrez',2),detalleVenta(1,6,0)).
venta(6587,vendedor('Jos� Prado',3),detalleVenta(2,2,30)).
venta(745,vendedor('Mario Torrez',2),detalleVenta(2,2,80)).
venta(958,vendedor('Jos� Prado',3),detalleVenta(3,1,30)).
venta(851,vendedor('Marcela Carrasco',1),detalleVenta(4,2,60)).
venta(471,vendedor('Mario Torrez',2),detalleVenta(3,1,0)).
venta(6587,vendedor('Jos� Prado',3),detalleVenta(5,3,30)).
venta(6587,vendedor('Jos� Prado',3),detalleVenta(4,2,30)).
venta(471,vendedor('Marcela Carrasco',2),detalleVenta(5,3,0)).
venta(471,vendedor('Marcela Carrasco',2),detalleVenta(2,4,0)).
venta(365,vendedor('Marcela Carrasco',2),detalleVenta(1,2,80)).
venta(4874,vendedor('Mario Torrez',3),detalleVenta(5,2,60)).

region(1, 'Central').
region(2, 'Noroeste').
region(3, 'Patagonia').

producto(1,'Bomba de agua',700).
producto(2,'Filtro de combustible',250).
producto(3,'Filtro de aceite',150).
producto(4,'Pastilla de Frenos',480).
producto(5,'Liquido refrigerante',150).


% i.	Listar el n�mero de factura,  el nombre de regi�n y el nombre del producto asociado de cada venta que posea un precio unitario mayor a 300.
detalleVentas(Factura, NombreRegion, NombreProducto) :- venta(Factura,vendedor(_,CodigoRegion), detalleVenta(CodigoProducto,_,_),
							region(CodigoRegion, NombreRegion), 
							producto(CodigoProducto,NombreProducto,Precio),
							Precio > 300.


regla1(Lista) :- findall([Factura, NombreVendedor, NombreRegion], detalleVentas(Factura, NombreVendedor, NombreRegion),Lista)).


%ii.	Dado el nombre de una regi�n, mostrar la sumatoria de todas las cantidades vendidas en la regi�n
regla2(NombreRegion, Cantidad) :- region(CodigoRegion, NombreRegion), 
						      findall(Cantidad, venta(_,vendedor(_,CodigoRegion),detalleVenta(_,Cantidad,_)),Lista), 
						      sumlist(Lista, Cantidad).

%iii.	Listar los montos de venta totales de las regiones 1 y 2, el monto de venta total se calcula como 
%       (precio unitario del producto * cantidad � descuento), listar la regi�n y el monto asociado
montoPorRegion(CodigoRegion, MontoTotal) :- findall(Monto,venta(_,vendedor(_,CodigoRegion),detalleVenta(CodProd, Cant,Desc)), producto(CodProd,_,Precio), Monto is (Precio * Cant - Desc)),Lista), 
					      sumlist(Lista, MontoTotal).

regla3(Lista) :- findall([CodigoRegion, MontoTotal],(region(CodigoRegion, _),(CodigoRegion =:= 1; CodigoRegion =:= 2), montoPorRegion(CodigoRegion, MontoTotal)),Lista). 


