#!/bin/bash
echo "Prueba"
echo "Bienvenido a la gestion de commit--betaS"

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


echo "Desea continuar?"
git push origin

echo "Commit finalizado"
