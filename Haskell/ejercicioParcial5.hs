pena_en_anios :: Int -> Int
pena_en_anios x | x == 1 = 1
                | x == 2 = 2
                | x == 3 = 2
                | x == 4 = 5
                | x == 5 = 5
                | x == 6 = 3
                | otherwise = 0


condena_total :: [Int] -> [Int]
condena_total [] = []
condena_total (x:xs) = (pena_en_anios x) : condena_total xs


anios_efectivos :: [Int] -> [Int]
anios_efectivos [] = []
anios_efectivos (x:xs)  | pena_en_anios x <= 5 = pena_en_anios x - 1 : anios_efectivos xs
                        | pena_en_anios x > 5 && pena_en_anios x <= 10 = pena_en_anios x - 3 : anios_efectivos xs
                        | pena_en_anios x > 10 = pena_en_anios x - 6 : anios_efectivos xs
                
