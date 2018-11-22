ayuda="Forma de uso: calculadora\ncalculadora basada en la notaciOn polaca inversa\nOperandos:\nsuma(+), resta(-), multiplicaciOn (*), divisiOn (/), mOdulo (MOD),\n
potencia (^), raIz cuadrada (SQR), factorial (!) e impresiOn (PRINT).\n" #cadena que se imprime al ejecutar el scrip con la opción --help

#'entradas permitidas'
while getopts ':help:\?:' opcion; do
  case "$opcion" in
    -help) echo "$ayuda"
       exit
       ;;
    
   -\?) printf "Opciones:\n--help --> Uso del programa\n" 
       exit 1 #Salida con Systax Error
       ;;
  esac
done
