%Hechos+Reglas=Base de Conocimiento
%Id,nombre,porcentaje,fecha,mesesCampaña
variacionRansomware(1,grandcrab,78.5,fecha(10,01,2020),[enero,febrero,marzo,abril]).
variacionRansomware(2,babuk,7.61,fecha(05,07,2020),[julio,agosto]).
variacionRansomware(3,cerber,3.11,fecha(20,01,2020),[enero,febrero,diciembre]).
variacionRansomware(4,matsnu,2.63,fecha(03,04,2020),[abril,octubre]).
variacionRansomware(5,wannacry,2.41,fecha(29,06,2020),[junio,septiembre]).
variacionRansomware(6,congur,1.52,fecha(05,07,2020),[julio]).
variacionRansomware(7,locky,1.29,fecha(12,05,2020),[mayo,diciembre]).
variacionRansomware(8,teslacrypt,1.12,fecha(04,11,2020),[noviembre,diciembre]).
variacionRansomware(9,rkor,1.11,fecha(10,03,2020),[marzo,mayo]).
variacionRansomware(10,reveton,0.70,fecha(29,08,2020),[agosto]).
%Id,tipo
distribucion(1,pe).
distribucion(2,android).
distribucion(3,dll).
distribucion(4,gzip).
distribucion(5,javascript).
%nombre,firma,tipo,distribucion
troyano(emotet,true,1,[2,3,4]).
troyano(ezbot,false,3,[6,1,10,2]).
troyano(edridex,false,5,[9,5,3]).
troyano(egozi,true,4,[7,10,4]).
troyano(edanabot,true,2,[8,1,5]).
%Reglas
%Regla1
regla1(X,Y):-variacionRansomware(_,_,_,fecha(_,X,Y),LISTA),member('diciembre',LISTA).
%Regla2
regla2(X,N,T):-variacionRansomware(I,X,_,_,_), troyano(N,_,T,LISTA),member(I,LISTA).
%Regla3
%Regla3 sin findall
regla3sinFA(X):-variacionRansomware(_,X,_,fecha(_,M,A),_),M>0,M<4,A=2020.
%Regla3 con findall
regla3(X):-findall(X,(variacionRansomware(_,X,_,fecha(_,M,A),_),M>0,M<4,A=2020),X).
%Regla4
regla4(NombreLista):-findall(NombreAux,(variacionRansomware(_,NombreAux,_,_,Fecha),member(Mes,Fecha),Mes=enero),NombreListaAux),findall(Nombre,(member(Nombre,NombreListaAux),variacionRansomware(_,Nombre,_,_,FechaA),member(MesA,FechaA),MesA=diciembre),NombreLista).
%Regla5
regla5(X):-troyano(_,T,_,LISTA),T='true',length(LISTA,X).

