--Consigna 1
funcion1 :: Int -> Int -> Int
funcion1 x n
  | n > 0 = x + 1
  | n < 0 = x - 1
  | otherwise = 0


--Consigna 2
validar_pos :: Int -> Int -> Bool
validar_pos x n = funcion1 x n == x+1

validar_neg :: Int -> Int -> Bool
validar_neg x n = funcion1 x n == x-1

funcion2 :: [Int] -> Int -> [Int]
funcion2 [] y= []
funcion2 (x:xs) n
  | validar_pos x n = x+1:funcion2 xs n
  | validar_neg x n = x-1:funcion2 xs n
  | otherwise = 0:funcion2 xs n


--Consigna 3
factorial 0 = 1
factorial num = num * factorial (num-1)

funcion3 :: (Ord t, Floating t) => t -> t -> t
funcion3 x n | n == 1 = 1 + x / factorial n 
             | n>1 && x>0 = ((1 / factorial (n)) * (x**n)) + funcion3 x (n-1) 
             | otherwise = 1


--Consigna 4
posicion :: Float -> Float
posicion x = if x >= 0.0 && x <= 6.284 then x else (-2)

taylorSerie :: Float -> Integer -> Float
taylorSerie x n
          |n > 9 = 0
          |otherwise =  ( fromIntegral((-1)^n) / fromIntegral(factorial(2*n +1)) ) * x^(2*n+1)  + taylorSerie x (n+1)

funcion4 :: Float -> Float
funcion4 x = if (posicion x) == (-2) then (-2)
         else taylorSerie x 0 

--Consigna 5
funcion5 [] = []
funcion5 (h:t)=if length (h:t) > 0 then [x| x <-[(h, funcion4 h)]] ++ funcion5 t else []


--Consigna 6
funcion6 :: (Ord a1, Num a1, Num a2) => a2 -> a1 -> (a2, a2)
funcion6 x n | n>0 = (x, x+1)
             | n<0 = (x,x-1)
             | n==0 = (0,0)