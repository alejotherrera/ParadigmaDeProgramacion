--Nicolás Colacioppo

funcion1::Char -> Char
funcion1 x | x=='a' = '1'
           | x=='e' = '2'
           | x=='i' = '3'
           | x=='o' = '4'
           | x=='u' = '5'
           | otherwise = '0'


validar::Char -> Bool
validar x = x=='a' || x=='e' || x =='i' || x=='o' || x=='u'


codificar::String -> String
codificar [] = []
codificar (h:t) = if validar h then funcion1 h : codificar t else h: codificar t
