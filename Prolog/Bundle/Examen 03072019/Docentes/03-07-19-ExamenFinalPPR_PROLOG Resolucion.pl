venta(235,vendedor('Alejandro Figueroa',1),detalleVenta(1,30,2)).
venta(487,vendedor('Monica Rodriguez',2),detalleVenta(5,45,8)).
venta(235,vendedor('Alejandro Figueroa',1),detalleVenta(4,70,2)).
venta(3790,vendedor('David Soria',3),detalleVenta(1,40,6)).
venta(650,vendedor('Monica Rodriguez',2),detalleVenta(3,65,8)).
venta(3790,vendedor('David Soria',3),detalleVenta(3.76,6)).
venta(471,vendedor('David Soria',2),detalleVenta(1,60,0)).
venta(6587,vendedor('Alejandro Figueroa',3),detalleVenta(2,45,3)).
venta(745,vendedor('David Soria',2),detalleVenta(2,80,8)).
venta(958,vendedor('Alejandro Figueroa',3),detalleVenta(3,100,3)).
venta(851,vendedor('Monica Rodriguez',1),detalleVenta(4,45,6)).
venta(471,vendedor('David Soria',2),detalleVenta(3,95,0)).
venta(6587,vendedor('Alejandro Figueroa',3),detalleVenta(5,35,3)).
venta(6587,vendedor('Alejandro Figueroa',3),detalleVenta(4,75,3)).
venta(471,vendedor('Monica Rodriguez',2),detalleVenta(5,55,0)).
venta(471,vendedor('Monica Rodriguez',2),detalleVenta(2,90,0)).
venta(650,vendedor('Monica Rodriguez',2),detalleVenta(1,85,8)).
venta(3790,vendedor('David Soria',3),detalleVenta(5,80,6)).

region(1, 'Centro').
region(2, 'Sur').
region(3, 'Norte').

producto(1,'Fideos',70).
producto(2,'Aceite',180).
producto(3,'Azucar',65).
producto(4,'Yerba',90).
producto(5,'Leche',55).


% i.	detalleVentas: Listar de cada venta, número de factura,  nombre de región y el nombre del producto asociado.
detalleVentas(Factura, NombreRegion, NombreProducto) :- venta(Factura,vendedor(_,CodigoRegion), detalleVenta(CodigoProducto,_,_),
							region(CodigoRegion, NombreRegion),
							producto(CodigoProducto,NombreProducto,_).


detalleVentas(Lista) :- findall([Factura, NombreVendedor, NombreRegion], venta(Factura,_,_),Lista)).


%ii.	cantidadProductosPorRegion: Dado el nombre de una región, mostrar la cantidad de productos vendidos en la misma
cantidadProductosPorRegion(NombreRegion, Cantidad) :- region(CodigoRegion, NombreRegion),
						      findall(Cantidad, venta(_,vendedor(_,CodigoRegion),detalleVenta(_,Cantidad,_)),Lista),
						      sumlist(Lista, Cantidad).

%iii.	montoPorRegion: Dado el código de una región mostrar el monto de venta total de la misma, el monto de venta individual se calcula como [precio unitario del producto por cantidad – descuento]
montoPorRegion(CodigoRegion, MontoTotal) :- findall(Monto,venta(_,vendedor(_,CodigoRegion),detalleVenta(CodProd, Cant,Desc)), producto(CodProd,_,Precio), Monto is (Precio * Cant - Desc)),Lista),
					      sumlist(Lista, MontoTotal).



