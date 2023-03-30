#!/bin/bash

# Función para generar un número de cuenta aleatorio
function generar_cuenta_aleatoria {
    while true; do
        # Generar un número de cuenta aleatorio de 7 dígitos
        cuenta=$((1000000 + RANDOM % 9000000))
        # Comprobar si la cuenta ya existe en el archivo de datos
        if ! grep -q "^$cuenta" "$datos_file"; then
            # Si la cuenta no existe, se devuelve el número generado
            echo "$cuenta"
            break
        fi
    done
}

# Función para crear un archivo de datos predeterminado si el archivo no existe o está vacío
function crear_datos_predeterminados {
    # Verificar si el archivo existe
    if [ ! -f "$datos_file" ]; then
        # Si el archivo no existe, crearlo
        touch "$datos_file"
    fi
    
    # Verificar si el archivo está vacío
    if [ ! -s "$datos_file" ]; then
        # Si el archivo está vacío, agregar un registro predeterminado
        cuenta=$(generar_cuenta_aleatoria)
        saldo="1021€"
        ultimo_movimiento="0€"
        titular="$(whoami)"
        read -s -p "Introduzca su clave: " clave
        echo "$cuenta - $saldo - $ultimo_movimiento - $titular - $clave" >> "$datos_file"
    fi
}

# Definir la ruta del archivo de datos
datos_file="$HOME/Documentos/datos_bancarios.txt"

# Comprobar si el archivo de datos existe y si no, crearlo y agregar un registro predeterminado
crear_datos_predeterminados

# Bucle para mostrar el menú
while true; do
    # Mostrar el menú
    echo "Bienvenido al sistema bancario"
    echo "1. Consultar saldo"
    echo "2. Consultar último movimiento"
    echo "3. Salir"
    
    # Leer la opción del usuario
    read -p "Introduzca una opción: " opcion
    
    # Comprobar la opción seleccionada
    case "$opcion" in
        1)
            # Leer el titular y la clave del usuario
            read -p "Introduzca titular de cuenta: " titular
            read -s -p "Introduzca su clave: " clave
            
            # Buscar la cuenta en el archivo de datos
            cuenta_info=$(grep "$titular" "$datos_file" | awk -v c="$clave" -F' - ' '$NF == c')
            
            if [ -z "$cuenta_info" ]; then
                echo "Lo siento, no se ha encontrado la cuenta especificada o la clave especificada no es correcta."
            else
                # Extraer la información de la cuenta
                cuenta_numero=$(echo "$cuenta_info" | cut -d' ' -f1)
                cuenta_saldo=$(echo "$cuenta_info" | cut -d' ' -f3)
                cuenta_ultimo_movimiento=$(echo "$cuenta_info" | cut -d' ' -f5)
                cuenta_titular=$(echo "$cuenta_info" | cut -d' ' -f7)
                cuenta_clave=$(echo "$cuenta_info" | cut -d' ' -f8)
                
                # Mostrar el saldo de la cuenta
                echo "El saldo de la cuenta $cuenta_saldo ."
            fi
        ;;
        2)
            # Leer el titular y la clave del usuario
            read -p "Introduzca titular de cuenta: " titular
            read -s -p "Introduzca su clave: " clave
            
            # Buscar la cuenta en el archivo de datos
            cuenta_info=$(grep "$titular" "$datos_file" | awk -v c="$clave" -F' - ' '$NF == c')
            
            if [ -z "$cuenta_info" ]; then
                echo "Lo siento, no se ha encontrado la cuenta especificada o la clave especificada no es correcta."
            else
                # Extraer la información de la cuenta
                cuenta_numero=$(echo "$cuenta_info" | cut -d' ' -f1)
                cuenta_saldo=$(echo "$cuenta_info" | cut -d' ' -f3)
                cuenta_ultimo_movimiento=$(echo "$cuenta_info" | cut -d' ' -f5)
                cuenta_titular=$(echo "$cuenta_info" | cut -d' ' -f7)
                cuenta_clave=$(echo "$cuenta_info" | cut -d' ' -f8)
                
                # Mostrar el saldo de la cuenta
                echo "El último movimiento es: $cuenta_ultimo_movimiento . "
            fi
        ;;
        3)
            # Sal del script:
            exit
        ;;
    esac
done
