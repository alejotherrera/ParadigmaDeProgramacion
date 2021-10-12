--Repaso recursion con listas.
lista = [10,20,30]

--1era funcion (obtiene la cantidad de menores a un valor p)
cantidadMenor [] _ = 0
cantidadMenor (x:xs) p = if x < p then 1 + cantidadMenor xs p else cantidadMenor xs p

--2da funcion permite calcular el porcentaje
porc p = fromIntegral(cantidadMenor lista p * 100)/ fromIntegral(length(lista))

         