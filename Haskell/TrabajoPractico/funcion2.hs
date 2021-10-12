funcion2 :: [Int] -> Int -> [Int]
funcion2 (x : xs) n
  | n > 0 = x + 1 : funcion2 xs n
  | n < 0 = x - 1 : funcion2 xs n
  | n == 0 = 0 : funcion2 xs n