#!/bin/bash
export LC_ALL=C # Cambia la codificacion local a ingles, asi el seq nos pone "." en vez de "," en los decimales


for alpha0 in $(seq 4 0.1 6); do
    #aux_alpha0=${alpha0/,/.} #Sustituye las , que genera por defecto "seq" por .
    echo -ne "alpha0: $alpha0 "
    scripts/run_vad.sh $alpha0 | grep TOTAL
done

# sort -t ":" -k 3nr caracter delimitador : -k "clave" 3 n de numero y r reverse