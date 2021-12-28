{-
velocidadEfectiva(tipo, velocidad): Calcula la velocidad efectiva del satélite de la siguiente forma: 
Si el tipo de satélite es uno, la velocidad efectiva es igual a la velocidad. 
Si el tipo es dos, la velocidad efectiva es el triple de la velocidad. 
Si el tipo es tres la velocidad efectiva es la mitad de la velocidad. 
Si el tipo es cuatro la velocidad efectiva es el cuadrado de la velocidad. (15 puntos)
-}

velocidadEfectiva(tipo, velocidad) 
	| tipo == 1 = velocidad
	| tipo == 2 = velocidad * 3
	| tipo == 3 = velocidad * 0.5
	| tipo == 4 = velocidad*velocidad
	| tipo == 5 = sqrt(velocidad)
	| otherwise = -1

{-
trayectoria(desde, hasta): Genera una lista de posiciones relativas que comienza con el valor “desde” y termina con “hasta” avanzando de dos en dos. 
Por ejemplo para valores: desde=14 y hasta=25 debe retornar [14, 16, 18, 20, 22, 24]. (15 puntos) 
-}

trayectoria(desde, hasta)
	|desde>=hasta = []
	|hasta>desde = desde:trayectoria(desde+2, hasta)


{-
puntoTrayectoria(desde, hasta, x): Dados dos valores: desde y hasta, permite obtener el valor de la lista generada por el punto anterior en la posición x. 
Por ejemplo, ante la llamada puntoTrayectoria(14, 25, 3) debe retornar 18. (20 puntos)
Nota: en caso utilizar un parámetro x con un valor fuera de rango respecto de los parámetros desde y hasta, deberá retornar -1. 
-}

--función auxiliar obtenerValor(lista, posicion)
obtenerValor((x:y), z) = if z==1 then x else obtenerValor (y,(z-1))

puntoTrayectoria(desde, hasta, x)
	|x<1 || x>length(lista) = -1
	|otherwise = obtenerValor(lista, x)
	where lista = trayectoria(desde, hasta)




