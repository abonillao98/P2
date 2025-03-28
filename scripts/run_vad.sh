#!/bin/bash

# Be sure that this file has execution permissions:
# Use the nautilus explorer or chmod +x run_vad.sh

alpha0=${1:-5} # Coge la variable $1 y, si no tiene un valor pasado por parametro, le asigna el valor 5 (:- es sintaxis)

# Establecemos que el código de retorno de un pipeline sea el del último programa con código de retorno
# distinto de cero, o cero si todos devuelven cero.
set -o pipefail # Sirve para que si en un pipeline hay diversos comandos y alguno produce error, que se cancele todo

# Write here the name and path of your program and database

DIR_P2=$HOME/PAV/P2
DB=$DIR_P2/db.v4
CMD="$DIR_P2/bin/vad -0 $alpha0"

for filewav in $DB/*/*wav; do #bucle principal. Para todos los ficheros de la BBDD mostrar el nombre de fichero, una comprob gil****as 
#    echo
    echo "**************** $filewav ****************"
    if [[ ! -f $filewav ]]; then 
	    echo "Wav file not found: $filewav" >&2
	    exit 1
    fi

    filevad=${filewav/.wav/.vad}   # Se hace una sustitucion en el bash. El nombre filewav se sustituye la extension .wav por .vad para generar el fichero de resultado

    $CMD -i $filewav -o $filevad || exit 1  # se ejecuta el comando definido mas arriba

# Alternatively, uncomment to create output wave files
#    filewavOut=${filewav/.wav/.vad.wav}
#    $CMD $filewav $filevad $filewavOut || exit 1

done

scripts/vad_evaluation.pl $DB/*/*lab # Se evalua el resultado

exit 0
