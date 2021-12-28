{-
   i. 	Dado un c�digo de regi�n determinar el porcentaje de ganancia que se percibe en dicha zona. 
Considerar los valores expresados en la siguiente tabla y tenga presente que si la funci�n recibe un c�digo de regi�n incorrecto la funci�n deber� retornar 0
-}

gananciaPorRegion :: Integer -> Double
gananciaPorRegion region 
			|region == 1 = 30.5  
                	|region == 2 = 22.5
			|region == 3 = 20.0
			|otherwise = 0.0
	
{-
   ii.	Desarrollar una funci�n que dado un c�digo de regi�n y una lista de montos facturados determine el total de ganancia obtenido por la empresa
-}

totalGanancias :: Integer-> [Double] -> Double
totalGanancias _ [] = 0
totalGanancias cod (x:xs) = (x * (gananciaPorRegion cod) / 100) + totalGanancias cod xs

--Sin recursion : totalGanancias cod lista = total * (gananciaPorRegion cod)/100.0 where total = sum lista

{-
   iii.	A partir de una lista de ganancias ya calculadas, determinar cu�ntas superan un valor promedio ingresado por par�metro
-}

gananciasMayorQue :: [Double] -> Double -> Integer 
gananciasMayorQue [] _ = 0
gananciasMayorQue (x:xs) valor = if x >= valor 
					then 1 + (comisionesMayorQue xs valor) 
					else comisionesMayorQue xs valor
