#!/bin/bash

#  ╔════════════════════════════════════════╗
#  ╠════════════════════════════════════════╣
#  ╠═════ CALCULADORA POLACA INVERSA ═══════╣
#  ║          CHEMA MARTÍN RAMOS            ║
#  ║          JORGE PÉREZ RAMOS             ║
#  ╠════════════════════════════════════════╣
#  ╚════════════════════════════════════════╝




#FUNCIONES DE MANEJO DE LA PILA


#========================
#creaPila <No argumentos> 
#         <No returns>
#========================
function creaPila(){
    if [[ "$#" -ne 0 ]];then #Comprobamos el numero de argumentos recibidos
        echo 'Syntax error: CreaPila:Error argumentos'
        exit 1

    else
        export p_Pila=1 #Inicio puntero de pila con base en 1
        eval declare -a pila #Declaramos que "pila" es una array

    fi
}


#==========================
#pushPila <input argumento> 
#         <No returns>
#==========================
function pushPila(){
    
    if [[ "$#" -ne 1 ]];then #Comprobamos el numero de argumentos recibidos
        echo 'Syntax error: Push:Error argumentos'
        exit 1

    else  #Si el numero de argumentos es correcto introducimo en la pila el valor de $1
        pila[$((p_Pila++))]=$1
     
    fi 
}


#===============================
#pullPila <No argumentos> 
#         <returns info[p_pila]>
#===============================
function pullPila(){

    if [[ $((p_Pila-1)) -le "0" ]];then #Comprobamos el numero de argumentos recibidos
        echo 'Missing operand: '$operando
        exit 3

    elif [[ "$#" -ne 1 ]];then
        echo 'Syntax error: Pull:Error arguments'
        exit 1

    else #Si tanto el numero de argumentos recibidos y la pila no se encuentra vacia --> sacamos de la pila 
        p_Pila=$(($p_Pila-1)) #Reducimos el puntero de pila
        eval "$1=${pila[$p_Pila]}" #Devolvemos el valor
    
    fi 
}


#==========================
#resetPila <No argumentos> 
#         <No returns>
#==========================
function resetPila(){
    if [[ "$#" -ne 0 ]];then #Comprobamos el numero de argumentos recibidos
        echo 'Syntax error: resetPila:Error arguments'
        exit 1
    else
        creaPila
        echo "Pila reseteada..."
    fi
}




#FUNCIONES DE OPERACIONES MATEMATICAS


#===========================
#raiz <Radicando> 
#     <Resultado de la raiz>
#===========================
function raiz(){
    if [[ "$#" -ne 1 ]];then #Comprobamos el numero de argumentos recibidos
        echo "Syntax error: SQR:Error arguments"
        exit 1
    elif [[ "$1" -lt 0 ]]; then 
        echo "Math error: SQR"
        exit 2
    else 
        echo "sqrt ($1)"|bc #Pasamos la operacion de raiz a la calculadora bc
    fi
}



#=============================
#mOdulo <Dividendo> 
#       <Divisor>
#       <Modulo>
#=============================
function mOdulo(){
    if [[ "$#" -ne 2 ]];then #Comprobamos el numero de argumentos recibidos
        echo "Syntax error: MOD:Error arguments"
        exit 1

    else  
        echo "$1 % $2"|bc #Pasamos la operacion de modulo a la calculadora bc
    fi

}


#=============================
#potencia <Base> 
#         <Exponente>
#         <Resultado>
#=============================
function potencia(){
     if [[ "$#" -ne 2 ]];then #Comprobamos el numero de argumentos recibidos
        echo "Syntax error: Potencia:Error arguments"
        exit 1

    else  
        echo "$1 ^ $2"|bc #Pasamos potencia a la calculadora bc
    fi
}


#=============================
#factorial <Operando>
#         <Resultado>
#=============================
function factorial (){
    if [[ "$#" -ne 1 ]];then #Comprobamos el numero de argumentos recibidos
        echo "Syntax error: Factorial:Error arguments"
        exit 1

    else 
        if [[ $1 -lt 0 ]];then #Comprobamos el numero de argumentos recibidos
            echo "Math error: \!"
            exit 2

        elif [[ $1 -le 1 ]];then #Caso base del factorial cuando ($1 es <= 1)
            echo 1

        else
            echo $(($1 * $(factorial $[$1-1]))) #calulo del factorial por recurividad
        fi
    fi 
      
}


#======================================
#imprimir <Argumento a imprimir> 
#         <No returns; Echo argumento>
#======================================
function imprimir(){
    if [[ "$#" -ne 1 ]];then #Comprobamos el numero de argumentos recibidos
        echo "Syntax error: Print:Error arguments"
        exit 1

    else 
        echo $1
    fi

}


#=============================
#multiplicar <Factor1> 
#            <Factor2>
#            <Producto>
#=============================
function multiplicar(){
    if [[ "$#" -ne 2 ]];then #Comprobamos el numero de argumentos recibidos
        echo "Syntax error: Multiplicar:Error arguments"
        exit 1

    else 
        echo $(($1 * $2))
    fi
}


#=============================
#suma <Sumando1> 
#     <Sumando2>
#     s<Suma>
#=============================
function  suma(){
   if [[ "$#" -ne 2 ]];then #Comprobamos el numero de argumentos recibidos
        echo "Syntax error: Suma:Error arguments"
        exit 1
    else 
        echo $(($1 + $2))
    fi
}


#=============================
#resta<Minuendo> 
#      <Sustraendo>
#      <Diferencia>
#=============================
function  resta(){
   if [[ "$#" -ne 2 ]];then #Comprobamos el numero de argumentos recibidos
        echo "Syntax error: Resta:Error arguments"
        exit 1
    else 
        echo $(($1 - $2))
    fi
}


#=============================
#division <Dividendo> 
#         <Divisor>
#         <Cociente>
#=============================
function  division(){
   if [[ "$#" -ne 2 ]];then #Comprobamos el numero de argumentos recibidos
        echo "Syntax error: Division:Error arguments"
        exit 1
    else
        echo $(($1 / $2))
    fi
}




#FUNCION LECTURA + CASE


#=============================
#lectura <UserInput> 
#        <Int> || <(opera)>
#=============================
function lectura(){
while read
do  
        Num_operandos=$(echo "$REPLY" | wc -w)
        for i in `eval echo {1..$(echo $Num_operandos)}`;
        do
       
        operando="`echo $REPLY | cut -d ' ' -f $i`"
       

        if ! [[ $operando =~ ^[+-]?[0-9]+$ ]];then #Comprobamos si el valor de operando es una operacion o un operando

        
             if [[ "$operando" = "*" ]];then
                pullPila temp1
                pullPila temp2
                pushPila `multiplicar $temp1 $temp2`
            elif [[ "$operando" = "!" ]];then
                pullPila temp
                pushPila `factorial $temp` 
            else
            case "$operando" in #Analisis de operando
                "PRINT")
                    pullPila tPrint
                    echo $tPrint 
                    ;;
                +)
                        
                    pullPila temp1
                    pullPila temp2                
                    pushPila  `suma $temp1 $temp2`
                    
                    ;;
                -)  
                    pullPila temp1 
                    pullPila temp2               
                    temp=$(resta $temp2 $temp1)
                    pushPila $temp  
                    ;;
                /)
                    pullPila temp1  
                    pullPila temp2 
                    if [[ $temp1 = 0 ]];then
                        echo 'Math error: /'
                        exit 2
                    else 
                        temp=`division $temp2 $temp1`
                        pushPila $temp  
                    fi
                    ;;
                "MOD")
                    pullPila temp1  
                    pullPila temp2  
                    temp=$(mOdulo $temp2 $temp1)                      
                    pushPila $temp  
                    ;;
                ^)
                    #posible Eror
                    pullPila temp1 # base 
                    pullPila temp2 # exponente  
                    temp=$(potencia $temp2 $temp1)
                    pushPila $temp  
                    ;;
                "SQR")
                    pullPila temp1                      
                    temp=$(raiz $temp1) 
                    pushPila $temp  
                    ;;
            
                *)
                    echo "Syntax error: $operando"
                    exit 1
                
                    ;;
            esac #Fin case
            fi 
        else
           pushPila "$operando" #Introducimos en la pila el valor de operando si se trata de un numero   
        fi
                
        done

done
exit 0
}




#===========================================================================================
#===EJECUCION PROGRMA=======================================================================


set -f #Desabilitamos la sustitucion del simbolo "*" por nombres de archivos
if [[ "$1" = '--help' ]];then
    printf "Forma de uso: calculadora\n\tcalculadora basada en la notaciOn polaca inversa\nOperandos:\n\tsuma(+), resta(-), multiplicaciOn (*), divisiOn (/), mOdulo (MOD),
    \tpotencia (^), raIz cuadrada (SQR), factorial (\!) e impresiOn (PRINT).\n"
    exit
else
    creaPila
    lectura
    exit 0
fi


#COMPROBACION DE QUE LA PILA ESTE VACIA TRAS FINALIZAR EL PROGRAMA
if [[ $p_Pila -ne 1 ]];then #Comprobamos que base de la pila sea 1, es decir que este vacia
    echo 'Stack not empty: <EOF>'
    exit 4
fi