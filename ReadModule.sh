k=0
while read
do
        for i in `eval echo {1..$(echo $REPLY | wc -w|cut -c 8)}`;
        do
                #m[$((k++))]="`echo $REPLY | cut -d ' ' -f $i`"
                pushPila "`echo $REPLY | cut -d ' ' -f $i`"       
        done
done
