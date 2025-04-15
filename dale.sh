#!/bin/bash
export LC_ALL=C # Cambia la codificacion local a ingles, asi el seq nos pone "." en vez de "," en los decimales


#for alpha0 in $(seq 5 0.01 5.2); do
    #aux_alpha0=${alpha0/,/.} #Sustituye las , que genera por defecto "seq" por .
    #echo -ne "alpha0: $alpha0 "
    #scripts/run_vad.sh $alpha0 | grep TOTAL
#done

# Se comenta lo de arriba y se añade esta parte para ver vad_evaluation.pl con alpha0=5.1

alpha0=5.1
echo -ne "alpha0: $alpha0 "
scripts/run_vad.sh $alpha0

# sort -t ":" -k 3nr caracter delimitador : -k "clave" 3 n de numero y r reverse