lista :: [Integer]
lista = [50,150,287,500,876,425,890,60,678,567,480,789,567,359,345,230,678,679,236]

funcion1 x |x>=0 && x<=49="Nivel Bajo"
           |x>=50 && x<=300="Nivel Aceptable"
           |x>300 && x<601="Nivel Medio"
           |x>601="Nivel Alto"


funcion2[]=0
funcion2(x:xs)=if funcion1 x=="Nivel Aceptable" then 1+funcion2 xs else funcion2 xs


funcion3 p=[x|x<-lista,x>p]





