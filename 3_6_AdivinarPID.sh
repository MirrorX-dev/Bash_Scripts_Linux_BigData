#!/bin/bash

echo "[Debug]: El PID de este proceso es: $$"
echo "¡Adivina el PID! Escribe un número para intentarlo."

pid=$$
read guess

until [[ $guess -eq $pid ]]; do
  if [[ $guess -lt $pid ]]; then
    echo "El PID es mayor que $guess. Sigue intentándolo."
  else
    echo "El PID es menor que $guess. Sigue intentándolo."
  fi
  read guess
done

echo "¡Correcto! El PID es $pid."

