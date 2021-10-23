#!/bin/bash

echo "Bienvenido a la gestion de commit--beta"

echo "Pulse una tecla para git status"
read tecla
git status
echo "-----------------------------------"
echo "Pulse una tecla para git add ."
read tecla
git add .
echo "-----------------------------------"
echo "Pulse una telca para git commit -m"
read tecla
echo "Ingrese el nombre del commit: "
read commitname
git commit -m "$commitname"
echo "Commit preparado"
echo "-----------------------------------"
echo "Ingrese una tecla para git status"
read tecla
git status
echo "-----------------------------------"
echo "Ingrese la rama que desea modificar: (enter para default)"
read ramabranch
git push origin $ramabranch
echo "-----------------------------------"
echo "Commit finalizado, gracias por utilizar el programa"
echo " Alejo Herrera- DEVscript"
