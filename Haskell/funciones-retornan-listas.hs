--funci�n que retorna una lista usando operador :
generarLista::Integer->[Integer]
generarLista 0 = []
generarLista num |num>0 = num:generarLista(num-1)
            	 |otherwise = []   

--funci�n que retorna una lista usando operador ++
--generarLista1::Integer->[Integer]
generarLista1 0 = []
generarLista1 num |num>0 = [num] ++ generarLista1 (num - 1)
                  |otherwise=[]

--otro ejemplo tome como parametro una lista y genere otra lista con condici�n(pares)
generarLista2 [] = []
generarLista2 (x:xs) = if odd x then x:generarLista2 (xs) else generarLista2 (xs) 


