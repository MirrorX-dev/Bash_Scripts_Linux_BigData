#!/bin/bash

# Pedimos al usuario que introduzca un número
read -p "Introduce un número para comprobar si es divisible entre 101: " num

# Comprobamos si el usuario ha introducido un número
if ! [[ "$num" =~ ^[0-9]+$ ]]; then
  echo "Debes introducir un número entero."
  echo "Uso: $0"
  exit 1
fi

# Realizamos la operación de módulo
if (( num % 101 == 0 )); then
  echo "$num es divisible entre 101."
else
  # Calculamos el número más cercano que sí es divisible entre 101
  div=$(( num / 101 ))
  next_div=$(( div + 1 ))
  prev_div=$(( div - 1 ))
  next_num=$(( next_div * 101 ))
  prev_num=$(( prev_div * 101 ))

  # Comparamos la distancia del número más cercano con el número introducido
  next_dist=$(( next_num - num ))
  prev_dist=$(( num - prev_num ))

  if (( next_dist < prev_dist )); then
    echo "$num no es divisible entre 101. El número más cercano que sí es divisible es $next_num."
  else
    echo "$num no es divisible entre 101. El número más cercano que sí es divisible es $prev_num."
  fi
fi

