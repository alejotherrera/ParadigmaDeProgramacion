pena_en_anios :: Integer->Integer
pena_en_anios x
	|x == 1 = 1
	|(x>=2 && x<=3) = 2
	|(x>=4 && x<=5) = 5
	|x == 6 = 3
	|otherwise = 0

condena_total::[Integer]->Integer
condena_total [] = 0
condena_total (x:xs) = pena_en_anios x + condena_total xs

anios_efectivos::[Integer]->Float
anios_efectivos xs
	| anios<=5 = anios*0.99
	| anios>5 && anios<=10.0 = anios*0.97
	| anios>10 = anios*0.94
	where anios = fromIntegral(condena_total xs)
