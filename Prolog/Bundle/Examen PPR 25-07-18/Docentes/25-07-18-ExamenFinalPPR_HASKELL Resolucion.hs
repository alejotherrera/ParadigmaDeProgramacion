
{-
   i. Dado un código de región y un importe de monto facturado, determinar la ganancia que se percibe en dicha zona. 
      Considerar los valores expresados en la siguiente tabla y tenga presente que si la función recibe un código de región incorrecto 
      la función deberá retornar 0
-}

gananciaPorRegion :: Integer -> Double -> Double
gananciaPorRegion region importe
			|region == 1 = importe * 10.5 / 100.0
			|region == 2 = importe * 15.5 / 100.0
			|region == 3 = importe * 20.0 / 100.0
			|otherwise = 0.0
	
{-
   ii.	Desarrollar una función que dado un código de región y una lista de montos facturados determine el total de ganancia (monto + ganancia) obtenido por la empresa
-}

totalGanancias :: Integer-> [Double] -> Double
totalGanancias _ [] = 0
totalGanancias cod (x:xs) = (x + (gananciaPorRegion cod x)) + totalGanancias cod xs

{-
   iii.	A partir de una lista de montos facturados y un código de región , generar una lista con las ganancias obtenidas de cada uno de los montos, 
       que no superen un valor ingresado por parámetro
-}

gananciasMenorQue :: [Double] -> Integer-> Double -> [Double] 
gananciasMenorQue [] _ _ = []
gananciasMenorQue (x:xs) cod valor = if (gananciaPorRegion cod x) < valor 
					then x : gananciasMenorQue xs cod valor
					else gananciasMenorQue xs cod valor

--ó usando listas por comprensión
gananciasMenorQue lista cod valor = [x | x <- lista, ((gananciaPorRegion cod x) < valor)]

