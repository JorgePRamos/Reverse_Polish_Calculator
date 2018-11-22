#========= UPDATED 09/11/2018====
#====================================
#====================================
#LECTIRA_IO + CASE ===========
#====================================
#====================================
function lectura(){
k=0
while read
do
        for i in `eval echo {1..$(echo $REPLY | wc -w|cut -c 8)}`;
        do
                #m[$((k++))]="`echo $REPLY | cut -d ' ' -f $i`"
        operando="`echo $REPLY | cut -d ' ' -f $i`"
       

        if ! [[ "$operando" =~ ^[0-9] ]];then
            if [[ "$operando" = "*" ]];then
                $operando = "POR"

                #pullPila temp1
                #pullPila temp2
                #pushPila `multiplicar $temp1 $temp2`
            elif [[ "$operando" = "!" ]];then
                pullPila temp
                pushPila `factorial $temp` 
            else
            case "$operando" in
                "PRINT")
                pullPila tPrint
                    echo $tPrint #Experimento 2
                 
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
                    temp=$(division $temp2 $temp1)                      
                    pushPila $temp  
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
                "SQRT")
                    pullPila temp1                      
                    temp=$(raiz $temp1) 
                    pushPila $temp  
                    ;;
                "POR")
                pullPila temp1
                pullPila temp2
                pushPila `multiplicar $temp1 $temp2`
                ;;
            
                *)
                    echo "Syntax error CASE: $operando"
                    exit 1
                    ;;
            esac
            fi 
        else
           pushPila "$operando"       
        fi
                
        done
done
}