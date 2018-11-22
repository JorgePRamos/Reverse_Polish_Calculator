#!/bin/bash
#========= UPDATED 09/11/2018====
#====================================
#====================================
#FUNCIONES MATEMATICAS ===========
#====================================
#====================================

function raiz(){
    if [[ "$#" -ne 1 ]];then
        echo "Syntax error"
        exit 1
    elif [[ "$1" -lt 0 ]]; then 
        echo "Math error"
        exit 2
    else 
        echo "sqrt ($1)"|bc
    fi
}
function mOdulo(){
    if [[ "$#" -ne 2 ]];then
        echo "Syntax error"
        exit 1
    else  
        echo "$1 % $2"|bc
    fi

}
function potencia(){
     if [[ "$#" -ne 2 ]];then
        echo "Syntax error"
        exit 1
    else  
        echo "$1 ^ $2"|bc
    fi
}
function factorial (){
    if [[ "$#" -ne 1 ]];then
        echo "Syntax error"
        #exit
    else 
        if [[ $1 -lt 0 ]];then
            echo "Math error"
            exit 2
        elif [[ $1 -le 1 ]];then
            echo 1
        else
            echo $(($1 * $(factorial $[$1-1])))
        fi
    fi 
      
}
function imprimir(){
    if [[ "$#" -ne 1 ]];then
        echo "Syntax error"
        exit 1
    else 
        echo $1
    fi

}
function multiplicar(){
    if [[ "$#" -ne 2 ]];then #atributos deben de ser ==2
        echo "Syntax error"
        exit 1
    else 
        echo $(($1 * $2))
    fi
}
function  suma(){
   if [[ "$#" -ne 2 ]];then #atributos deben de ser ==2
        echo "Syntax error"
        exit 1
    else 
        echo $(($1 + $2))
    fi
}
function  resta(){
   if [[ "$#" -ne 2 ]];then #atributos deben de ser ==2
        echo "Syntax error"
        exit 1
    else 
        echo $(($1 - $2))
    fi
}

function  division(){
   if [[ "$#" -ne 2 ]];then #atributos deben de ser ==2
        echo "Syntax error"
        exit 1
    else 
        echo $(($1 / $2))
    fi
}





#====================================
#====================================
#RECURSIVIDAD_INUTIL ===========
#====================================
#====================================

#if [[ ${m[((--k))]} != 'PRINT' ]];then 
function operar(){

    if [[ "$#" -ne 1 ]];then
        echo "Syntax error"
        #exit
    else 
        if ! [[ "$1" =~ ^[0-9] ]];then
            if [[ "$1" = * ]];then
                echo $(multiplicar `operar "$(pullPila)"` `operar "$(pullPila)"`)
            elif [[ "$1" = ! ]];then
                echo $(factorial `operar "$(pullPila)"`)
            case "$1" in
                PRINT)
                    echo $(imprimir $(operar $(pullPila))) #Experimento 2
                    ;;
                +)
                    echo $(suma `operar "$(pullPila)"` `operar "$(pullPila)"`) #Experimento
                    ;;
                -)
                    echo $( resta `operar "$(pullPila)"` `operar "$(pullPila)"`)
                    ;;
                /)
                    echo $( division `operar "$(pullPila)"` `operar "$(pullPila)"`)
                    ;;
                MOD)
                    echo $( mOdulo `operar "$(pullPila)"` `operar "$(pullPila)"`)
                    ;;
                ^)
                    echo $( potencia `operar "$(pullPila)"``operar "$(pullPila)"`)
                    ;;
                SQRT)
                    echo $( raiz `operar "$(pullPila)"`)
                    ;;
            
                *)
                    echo "Syntax error: $1"
                    exit 1
                    ;;
            esac
            
            fi 
        else
            echo $1
        fi
    fi
}
#====================================
#====================================


