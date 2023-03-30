#!/bin/bash
read -p "Introduce un número para mostrar su tabla de multiplicar: " num  # Pide al usuario que introduzca un número y lo almacena en la variable $num.

for i in {1..10}     # Inicia un bucle for que recorre los números del 1 al 10.
do
    echo "$num x $i = $(($num*$i))"  # Imprime en pantalla el resultado de cada multiplicación en el formato solicitado.
done    # Finaliza el bucle for.

