#!/bin/bash

while true
do
  read -p "Introduzca el primer operador: " operador1
  read -p "Introduzca el segundo operador: " operador2

  echo "Los operadores son: $operador1 y $operador2"
  echo "OPERACIONES DISPONIBLES:"
  echo "1) Suma 2) Resta 3) Multiplicación 4) División 5) Resto"
  read -p "Seleccione la operación que desea realizar: " opcion

  case $opcion in
    1)
      resultado=$((operador1+operador2))
      ;;
    2)
      resultado=$((operador1-operador2))
      ;;
    3)
      resultado=$((operador1*operador2))
      ;;
    4)
      resultado=$((operador1/operador2))
      ;;
    5)
      resultado=$((operador1%operador2))
      ;;
    *)
      echo "Opción inválida"
      continue
      ;;
  esac

  if [ $resultado -lt 0 ]; then
    echo "El resultado es negativo. El programa terminará."
    break
  fi

  echo "El resultado es $resultado"
  
  read -p "Realizar otra operación con este valor (s/n)? " continuar

  if [ "$continuar" != "s" ]; then
    break
  fi
done

