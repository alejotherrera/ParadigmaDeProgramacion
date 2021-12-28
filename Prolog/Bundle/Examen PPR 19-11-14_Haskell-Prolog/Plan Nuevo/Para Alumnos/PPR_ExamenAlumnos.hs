f :: Float -> Float
f x = log (x^2 + 1) - (exp (x/2) * cos (pi * x))

valorMedio :: (Float, Float) -> Float
valorMedio (inf, sup) = (inf + sup) / 2


