#!/bin/bash

# Pedir la hora objetivo al usuario
read -p "¿A qué hora debe realizarse la acción? (formato: HH:MM) " hora_objetivo

# Validar la hora ingresada por el usuario
if ! date -d "$hora_objetivo" > /dev/null 2>&1; then
  echo "Hora inválida. Por favor, ingrese una hora válida en formato HH:MM."
  exit 1
fi

# Loop principal del script
while true; do
  # Obtener la hora actual
  hora_actual=$(date +"%H:%M")

  # Calcular la cantidad de segundos faltantes hasta la hora objetivo
  segundos_faltantes=$(($(date -d "$hora_objetivo" +%s) - $(date +%s)))

  # Si ya ha pasado la hora objetivo, salir del script
  if [[ $segundos_faltantes -le 0 ]]; then
    echo "¡Ya es hora de realizar la acción!"
    exit 0
  fi

  # Calcular las horas, minutos y segundos faltantes
  horas_faltantes=$((segundos_faltantes / 3600))
  minutos_faltantes=$(( (segundos_faltantes % 3600) / 60 ))
  segundos_restantes=$((segundos_faltantes % 60))

  # Imprimir el tiempo faltante en el formato HH:MM:SS
  printf "\rFaltan %02d:%02d:%02d para realizar la acción" $horas_faltantes $minutos_faltantes $segundos_restantes

  # Esperar 30 segundos antes de volver a actualizar la pantalla
  sleep 30
done

