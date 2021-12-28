
tasaVelocidadEfectiva :: Int -> Int -> Int
tasaVelocidadEfectiva x y   | x == 1 = y
                            | x == 2 = y * 3
                            | x == 3 = y `div` 2
                            | x == 4 = y ^ 2
                            | otherwise = 0


-- Ejercicio 2
trayectoria :: Int -> Int -> [Int]
trayectoria x y = if x < y then x: trayectoria (x+2) y else []


--funci�n auxiliar obtenerValor(lista, posicion)
obtenerValor((x:y), z) = if z==1 then x else obtenerValor (y,(z-1))

puntoTrayectoria(desde, hasta, x)
	|x<1 || x>length(lista) = -1
	|otherwise = obtenerValor(lista, x)
	where lista = trayectoria(desde, hasta)


