#!/bin/bash

# Lista de directorios a incluir en el archivo tar
dirs_to_include=(/home/hadoop/Documentos /home/hadoop/Descargas)

# Nombre del archivo tar.gz
today=$(date +%Y-%m%d)
tar_filename="$today.tar.gz"

# Nombre del archivo lst
lst_filename="$today.lst"

# Verificar si el archivo lst ya existe
if [ -e "$lst_filename" ]; then
    echo "Error: el archivo $lst_filename ya existe."
    exit 1
fi

# Verificar si todos los elementos en la lista son directorios
for dir in "${dirs_to_include[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "Error: $dir no es un directorio."
        exit 1
    fi
done

# Crear el archivo lst
echo "${dirs_to_include[@]}" > "$lst_filename"

# Crear el archivo tar.gz
tar -czf "$tar_filename" "${dirs_to_include[@]}"

echo "El archivo $tar_filename se ha creado con éxito."
echo "El archivo $lst_filename se ha creado con éxito."

