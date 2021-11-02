--Consigna1 Parcial
lista :: [Integer] 
lista = [50, 150, 287,500, 876, 425, 890, 60, 678, 567, 480, 789, 567, 359, 345, 230, 678, 679, 236] 


funcion1 :: Int -> String
funcion1 x  | x >= 0 && x <= 50     = "Nivel Bajo"
            | x > 50 && x <= 100    = "Nivel Aceptable"
            | x > 100 && x <= 200   = "Nivel Medio"
            | x > 701               = "Nivel Alto"
            | otherwise             = "Error, numero negativo"


funcion2[] = 0
funcion2 (x:xs) = if funcion1 x == "Nivel Aceptable" then 1 + funcion2 xs else funcion2 xs


funcion2guarda :: Num a => [Int] -> a
funcion2guarda (x:xs)   | funcion1 x == "Nivel Aceptable"   = 1 + funcion2guarda xs
                        | otherwise                         = funcion2guarda xs	


funcion3 :: [Integer] -> Integer -> [Integer]
funcion3 [] _ = []
funcion3 (x:xs) y = if x > y then x:funcion3 xs y
                    else funcion3 xs y 