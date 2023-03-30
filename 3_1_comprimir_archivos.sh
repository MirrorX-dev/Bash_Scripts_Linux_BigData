#!/bin/bash

# Obtiene el nombre del directorio a comprimir como primer argumento
dir_name=$1

# Ciclo que permite al usuario especificar el directorio de salida y corregir su entrada en caso de error
while true; do
  # Muestra el directorio actual y pregunta al usuario por el directorio de salida
  echo "Directorio actual: $(pwd)"
  echo -n "Especifique el directorio donde desea guardar el archivo comprimido [ENTER para usar el directorio actual]: "
  read -r output_dir

  # Si el usuario no especifica ninguna ruta, se usa el directorio actual como ruta de salida
  if [[ -z "$output_dir" ]]; then
    output_dir="./"
  fi

  # Verifica que el directorio de salida sea válido y que se tenga permiso de escritura
  if [[ ! -d "$output_dir" ]]; then
    echo "El directorio especificado no es válido."
    continue
  elif [[ ! -w "$output_dir" ]]; then
    echo "No se tienen permisos para escribir en el directorio especificado."
    continue
  else
    break
  fi
done

# Obtiene la fecha actual en formato yyyy-mm-dd
date=$(date +%Y-%m-%d)

# Crea el archivo tar comprimido con gzip y con el nombre adecuado
tar -czvf "${output_dir}/${date}.tar.gz" -C "$(dirname "$dir_name")" "$(basename "$dir_name")"

