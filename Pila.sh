#!/bin/bash
#Funciones de manejo de pila
#nota todas las funciones aceptan argumentos estos se refieren por orden ($1;$2...) no por nombre
#========= UPDATED 09/11/2018====

#creaPila <No argumentos> 
#         <No returns>

function creaPila(){
    if [[ "$#" -ne 0 ]];then 
        echo 'Crea:Error argumentos'
    else
        export p_Pila=1 #inicio de la pila
        eval declare -a pila 
    fi
}
function creaPilaAux(){
    if [[ "$#" -ne 0 ]];then 
        echo 'Crear:Error argumentos'
    else
        p_PilaAux=1 #inicio de la pila
        eval declare -a pila 
    fi
}

#pushPila <input argumento> 
#         <No returns>
function pushPila(){
    #$1 = argumento de la funcion; Solo tomamos 1
    if [[ "$#" -ne 1 ]];then
        echo 'Push:Error argumentos'
    else 
        echo "pushPila:pres p_pila=$p_Pila" >&2

        pila[$((p_Pila++))]=$1
         echo "pushPila:postp_pila=$p_Pila" >&2
    fi 
}

#pullPila <No argumentos> 
#         <returns info[p_pila]>
function pullPila(){
    if [[ $((p_Pila-1)) -le "0" ||  "$#" -ne 1 ]];then 
        echo 'Pull:Error Pointer access or Error on paramets'
        #exit
    else
        echo "pullPila:pres p_pila=$p_Pila" >&2
        p_Pila=$(($p_Pila-1))
        eval "$1=${pila[$p_Pila]}"
        echo "pullPila:post p_pila=$p_Pila" >&2
        #echo $p_Pila
     #   eval p_Pila=$((p_Pila-1))
        #echo $p_Pila
      #  
    
    fi 
}

#resetPila <No argumentos> 
#         <No returns>
function resetPila(){
    if [[ "$#" -ne 0 ]];then 
        echo 'Error argumentos'
    else
        creaPila
        echo "Pila reseteada..."
    fi
}