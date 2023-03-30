#!/bin/bash

while true
do
  read parametro
  echo $parametro
  if [[ $parametro == "fin" ]]; then
    break
  fi
done

