#!/bin/bash
# Comparacion del ultimo elemento == PRINT 
# m[k]== PRINT
# k-1 almacena el numero de elementos del array en este punto

function raiz(){
    if [[ "$#" -ne 1 ]];then
        echo "Syntax error"
        #exit
    else 
        echo "sqrt ($1)"|bc
    fi
}
function mOdulo(){
    if [[ "$#" -ne 2 ]];then
        echo "Syntax error"
        #exit
    else 
        echo "$1 % $2"|bc
        return
    fi

}
function factorial (){
    if [[ "$#" -ne 1 ]];then
        echo "Syntax error"
        #exit
    else 
        if [[ $1 -le 1 ]];then
        echo 1
        else
        
        echo $(($1 * $(factorial $[$1-1])))
    fi
    fi 
      
}
function imprimir(){
    if [[ "$#" -ne 1 ]];then
        echo "Syntax error"
        #exit
    else 
        echo $1
    fi

}
if [[ ${m[((--k))]} != 'PRINT' ]];then 
    echo 'Error print'
    #exit 1
#k almacena ahora el numero de elementos de array (0..k)
#elif 
# Proceder con la ejecucion

: <<'END'
if ! [[ "$scale" =~ ^[0-9]+$ ]]
    then
        echo "Sorry integers only"
fi

IDEA RECURSIVIDAD
funcion argumento
    swict case
        -
        -   
        -
        -
            funcion (argumento -k)
caso base?? es el return de los numeros??
return?? llamada a las funciones?




END

function operar(){
    if [[ "$#" -ne 1 ]];then
        echo "Syntax error"
        #exit
    else 
        if ! [[ "$1" =~ ^[0-9] ]];then
            if [[ "$1" = * ]];then
                multiplicar `operar "$(pullPila)"`
            elif [[ "$1" = ! ]];then
                factorial `operar "$(pullPila)"` 
            case "$1" in
                PRINT)
                    imprimir `operar "$(pullPila)"` 
                    ;;
                +)
                    suma `operar "$(pullPila)"` `operar "$(pullPila)"`
                    ;;
                -)
                    resta `operar "$(pullPila)"` `operar "$(pullPila)"`
                    ;;
                /)
                    division `operar "$(pullPila)"` `operar "$(pullPila)"`
                    ;;
                MOD)
                    mOdulo `operar "$(pullPila)"` `operar "$(pullPila)"`
                    ;;
                ^)
                    potencia `operar "$(pullPila)"``operar "$(pullPila)"`
                    ;;
                SQRT)
                    raiz `operar "$(pullPila)"`
                    ;;
            
                *)
                    echo "Syntax error"
                    ;;
            esac
            fi 
        else
    
        echo $1
        fi
    fi
}



fi

# 1 Idea Comprobar todo el array antes de calcular
# 2 idea combrobar antes de cada calculo
