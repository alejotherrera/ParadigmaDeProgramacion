porcDescuento :: Int -> Int -> Int
porcDescuento x y   | x == 1 && y <= 3 = 10
                    | x == 1 && y > 3 = 20
                    | x == 2 && y <= 3 = 12
                    | x == 2 && y > 3 = 25
                    | otherwise = 0


importeTotal :: Int -> Int -> Int -> Int
importeTotal x y z = z*y - (z*porcDescuento x y) `div` 100


cant_mayores :: (Num p, Ord t) => [t] -> t -> p
cant_mayores [] _ = 0
cant_mayores (x:xs) y = if x > y then 1 + cant_mayores xs y else cant_mayores xs y

