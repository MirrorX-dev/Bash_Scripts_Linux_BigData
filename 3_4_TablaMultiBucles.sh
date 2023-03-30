#!/bin/bash

while true; do
    if [ $# -eq 0 ]; then
        echo "Uso: $0 [numero]"
        read -p "Introduce un número: " NUM
    else
	# Asignamos el primer argumento a la variable NUM
        NUM=$1
    fi

    # Comprobamos si NUM es un número válido utilizando una expresión regular
    if ! [[ $NUM =~ ^[0-9]+$ ]]; then
        echo "Error: \"$NUM\" no es un número válido"
    else
        break
    fi
done

# Utilizamos el comando seq para generar una secuencia del 1 al 10,
# y utilizamos un bucle while para leer cada número de la secuencia
# y mostrar la correspondiente multiplicación
seq 1 10 | while read i; do
    echo "$NUM X $i = $((NUM*i))"
done


