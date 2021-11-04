
%factura(Nro_Liquidación,Nro_Medidor,lecturaAnterior(fecha(dia,mes,anio),kWh),lecturaActual(fecha(dia,mes,anio),kWh),codigoEscalafón)%
factura('00010-33550',161,lecturaAnterior(fecha(20,7,2018),32993),lecturaActual(fecha(20,8,2018),33158),1).
factura('00010-33551',162,lecturaAnterior(fecha(20,7,2018),27645),lecturaActual(fecha(20,8,2018),27895),2).
factura('00010-33552',163,lecturaAnterior(fecha(23,7,2018),31895),lecturaActual(fecha(23,8,2018),32015),1).
factura('00010-33553',164,lecturaAnterior(fecha(27,7,2018),15689),lecturaActual(fecha(27,8,2018),16000),1).
factura('00010-33554',165,lecturaAnterior(fecha(27,7,2018),42589),lecturaActual(fecha(27,8,2018),42789),2).

% usuario(dni,apellido,nombre,medidores).
%
usuario(23586985,perez,maria,[161,164]).
usuario(12589256,gomez,jose,[162,163]).
usuario(25689452,garcia,delfina,[165]).

% escalafon(Código_escalafón,Precio_unitario_por_kWh).
%
escalafon(1,2.72).
escalafon(2,3.54).


% 1) REGLA 1
% Mostrar el número de liquidación e importe neto de cada factura.
% El importe neto es igual al consumo actual multiplicado
% por el precio unitario, a lo cual se le suma un cargo fijo.
% Para ello considerar:
% -Cargo fijo de $ 47.84
% -Consumo actual: que es igual a la resta de la cantidad de kWh de la lectura actual menos la cantidad de kWh de la lectura anterior
% -Precio unitario: depende del código de escalafón asociado al medidor.

regla1(Numero,ImporteNeto):- factura(Numero,_,lecturaAnterior(_,Anterior),lecturaActual(_,Actual),CodigoEscalafon),
    escalafon(CodigoEscalafon,PrecioUnitario), ImporteNeto is 47.84 + (Actual - Anterior)* PrecioUnitario.



% 2) REGLA 2
% Determinar cuál es el consumo promedio, medido en kWh, de los
% habitantes de la ciudad.

consumoTotal(Total):-findall(ImporteNeto,regla1(_,ImporteNeto),Lista),sumlist(Lista,Total).

cantidadUsuarios(Cantidad):- findall(Dni,usuario(Dni,_,_,_),Lista),length(Lista,Cantidad).

regla2(ConsumoPromedio):- consumoTotal(Total), cantidadUsuarios(Cantidad), Cantidad > 0, ConsumoPromedio is Total/Cantidad.


% 3) REGLA 3
% Para un Dni pasado como argumento, mostrar por cada uno de
% sus números de medidor el importe neto, pero solo de aquellos medidores
% que tengan un importe neto mayor a un valor X (siendo X un valor pasado
% como argumento).

regla3(Dni,X,Medidor,Importe):-usuario(Dni,_,_,Lista),factura(Numero,Medidor,_,_,_),member(Medidor,Lista),regla1(Numero,Importe),Importe>X.










