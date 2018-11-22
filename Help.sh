#!/bin/bash
#Imprime mensaje ayuda caundo --help
ayuda="Forma de uso: calculadora\ncalculadora basada en la notaciOn polaca inversa\nOperandos:\nsuma(+), resta(-), multiplicaciOn (*), divisiOn (/), mOdulo (MOD),
potencia (^), raIz cuadrada (SQR), factorial (!) e impresiOn (PRINT)." #cadena que se imprime al ejecutar el scrip con la opción --help
#Error en la inicializacion de ayuda (!)
#'entradas permitidas'
#*Something* comprueba si la subString esta en $opcion
while read  opcion; do
  case "$opcion" in
  *--help*)
       echo "$ayuda"
       exit
       ;;
    
   *--\?*) printf "Opciones:\n--help --> Uso del programa\n" 
       exit 1 #Salida con Systax Error
       ;;
  esac
done
