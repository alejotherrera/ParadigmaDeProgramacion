--Nicolás Colacioppo

funcion1::Char -> Char
funcion1 x | x=='A' = '9'
           | x=='E' = '8'
           | x=='I' = '7'
           | x=='O' = '6'
           | x=='U' = '5'
           | otherwise = '0'


validar::Char -> Bool
validar x = x=='A' || x=='E' || x =='I' || x=='O' || x=='U'


codificar::String -> String
codificar [] = []
codificar (h:t) = if validar h then funcion1 h : codificar t else h: codificar t
