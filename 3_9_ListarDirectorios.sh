#!/bin/bash

i=1
for file in $(ls -1); do
    if [ -d "$file" ]; then
        echo "Fichero $i: $file"
        echo "Es un directorio!"
    else
        echo "Fichero $i: $file"
        echo "Es un fichero ordinario!"
    fi
    echo "----------"
    i=$((i+1))
done

