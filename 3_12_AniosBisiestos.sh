#!/bin/bash

# Obtener el año actual
year=$(date +"%Y")

# Comprobar si el año es divisible por 400
if [ $((year % 400)) -eq 0 ]; then
  echo "$year es bisiesto"
else
  # Comprobar si el año es divisible por 4 y no por 100
  if [ $((year % 4)) -eq 0 ] && [ $((year % 100)) -ne 0 ]; then
    echo "$year es bisiesto"
  else
    echo "$year no es bisiesto"
  fi
fi

