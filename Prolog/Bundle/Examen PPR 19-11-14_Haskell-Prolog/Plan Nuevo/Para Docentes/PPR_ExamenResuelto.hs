f :: Float -> Float
f x = log (x^2 + 1) - (exp (x/2) * cos (pi * x))

valorMedio :: (Float, Float) -> Float
valorMedio (inf, sup) = (inf + sup) / 2

corte :: (Float ,Float) -> (Float, Float) -> Float
corte intAct intProx = abs ((vmact - vmant) / vmact)
	where 
	vmant = valorMedio intAct
	vmact = valorMedio intProx


generarNuevoIntervalo :: (Float, Float) -> (Float, Float)
generarNuevoIntervalo (ci, cs) = if valor > 0 then (ci, vm) else (vm, cs)
	where 
	vm = valorMedio (ci, cs)
	valor = f vm


biseccion :: (Float, Float) -> Float
biseccion (ci, cs) = if corte (ci, cs) ni < 0.01 then vm else biseccion ni				   	
	where 
	vm = valorMedio(ci, cs)
	ni = generarNuevoIntervalo (ci, cs)