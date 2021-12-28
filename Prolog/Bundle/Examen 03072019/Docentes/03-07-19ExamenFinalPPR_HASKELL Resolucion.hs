{-
   i. 	Dado un código de región determinar el porcentaje de ganancia que se percibe en dicha zona. 
Considerar los valores expresados en la siguiente tabla y tenga presente que si la función recibe un código de región incorrecto la función deberá retornar 0
-}

gananciaPorRegion :: Integer -> Double
gananciaPorRegion region 
			|region == 1 = 30.5  
                	|region == 2 = 22.5
			|region == 3 = 20.0
			|otherwise = 0.0
	
{-
   ii.	Desarrollar una función que dado un código de región y una lista de montos facturados determine el total de ganancia obtenido por la empresa
-}

totalGanancias :: Integer-> [Double] -> Double
totalGanancias _ [] = 0
totalGanancias cod (x:xs) = (x * (gananciaPorRegion cod) / 100) + totalGanancias cod xs

--Sin recursion : totalGanancias cod lista = total * (gananciaPorRegion cod)/100.0 where total = sum lista

{-
   iii.	A partir de una lista de ganancias ya calculadas, determinar cuántas superan un valor promedio ingresado por parámetro
-}

gananciasMayorQue :: [Double] -> Double -> Integer 
gananciasMayorQue [] _ = 0
gananciasMayorQue (x:xs) valor = if x >= valor 
					then 1 + (comisionesMayorQue xs valor) 
					else comisionesMayorQue xs valor
