#!/bin/bash

echo "Bienvenido a la gestion de commit"
read ruta
echo "Pulse una tecla para git status"
read tecla
git status 
echo "Pulse una tecla para git add ."
read tecla
git add .
echo "Pulse una telca para git commit -m"
read tecla
echo "Ingrese el nombre del commit: "
read commitname
git commit -m "$commitname"
echo "Commit preparado"
echo "Ingrese una tecla para git status"
read tecla
git status
echo "Ingrese una tecla para git log"
read tecla
echo "Ingrese la rama a la que desea actualizar"
read ramabranch
git push origin $ramabranch

echo "Commit finalizado"