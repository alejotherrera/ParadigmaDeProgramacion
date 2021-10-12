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
funcion4 :: (Ord a, Floating a) => a -> a
funcion4 x | x > 0 && x <= 6.284 = x - x**3/factorial 3 + x**5/factorial 5 - x**7/factorial 7 + x**9/factorial 9 - x**11/factorial 11 + x**13/factorial 13 - x**15/factorial 15 + x**17/ factorial 17 - x**19/factorial 19
           | x == 0 = 0
           | otherwise = -2


--Consigna 5
funcion5 [] = [(),()]
funcion5 (h:t)=if length (h:t) > 0 then (x, [x| x <-[funcion4 h]]) ++ funcion5 t else []


--Consigna 6
funcion6 :: (Ord a1, Num a1, Num a2) => a2 -> a1 -> (a2, a2)
funcion6 x n | n>0 = (x, x+1)
             | n<0 = (x,x-1)
             | n==0 = (0,0)