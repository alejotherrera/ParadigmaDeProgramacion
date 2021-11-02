funcion1 :: Char -> Char
funcion1 x  | x == 'A' = '9'
            | x == 'E' = '8'
            | x == 'I' = '7'
            | x == 'O' = '6'
            | x == 'U' = '5'
            | otherwise = '0'


validar :: Char -> Bool
validar x   | x == 'A' = True
            | x == 'E' = True
            | x == 'I' = True
            | x == 'O' = True
            | x == 'U' = True
            | otherwise = False


codificacion :: Char -> Char
codificacion x  | x == 'A' = '9'
                | x == 'E' = '8'
                | x == 'I' = '7'
                | x == 'O' = '6'
                | x == 'U' = '5'
                | otherwise = x

codificar :: String -> String
codificar [] = []
codificar (h:t) = codificacion h : codificar t