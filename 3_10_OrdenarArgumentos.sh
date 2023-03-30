#!/bin/bash

# Ordenar argumentos alfabéticamente
sorted_args=$(printf "%s\n" "$@" | sort)

# Imprimir argumentos ordenados
echo "Argumentos ordenados:"
echo "$sorted_args"

