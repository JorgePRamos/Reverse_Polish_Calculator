#!/bin/bash
#Funciones de manejo de pila
#nota todas las funciones aceptan argumentos estos se refieren por orden ($1;$2...) no por nombre

#creaPila <No argumentos> 
#         <No returns>
# ¿no haria falta ponerle un nombre a la pila creada?
function creaPila(){
    if [[ "$#" -ne 0 ]];then 
        echo 'Error argumentos'
    else
        p_Pila=1 #inicio de la pila
        eval declare -a pila 
    fi
}

#pushPila <input argumento> 
#         <No returns>
function pushPila(){
    #$1 = argumento de la funcion; Solo tomamos 1
    if [[ "$#" -ne 1 ]];then
        echo 'Error argumentos'
    else 
        pila[$((p_Pila++))]=$1
    fi 
}

#pullPila <No argumentos> 
#         <returns info[p_pila]>
function pullPila(){
    if [[ $((p_Pila-1)) -le "0" ]];then 
        echo 'Error Pointer access'
        #exit
    else
        echo ${pila[$((--p_Pila))]} #return??
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
