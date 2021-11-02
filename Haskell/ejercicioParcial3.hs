
gananciaPorRegion :: Integer -> Double -> Double
gananciaPorRegion region importe
			|region == 1 = importe * 10.5 / 100.0
			|region == 2 = importe * 15.5 / 100.0
			|region == 3 = importe * 20.0 / 100.0
			|otherwise = 0.0


totalGanancias :: Integer-> [Double] -> Double
totalGanancias _ [] = 0
totalGanancias cod (x:xs) = (x + (gananciaPorRegion cod x)) + totalGanancias cod xs


gananciasMenorQue :: [Double] -> Integer-> Double -> [Double] 
gananciasMenorQue [] _ _ = []
gananciasMenorQue (x:xs) cod valor = if (gananciaPorRegion cod x) < valor 
					then x : gananciasMenorQue xs cod valor
					else gananciasMenorQue xs cod valor