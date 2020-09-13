namecmd=`docker images |awk '{print "name["NR"]=\""$1"\"\n"}'`
eval $namecmd
dockerIdCmd=`docker images |awk '{print "dockerid["NR"]=\""$3"\""}'`
eval $dockerIdCmd

delexist(){
    idx=$1 
    if [ $idx -le 2 ]; then
        return
    fi
    currentname=${name[$idx]}
    loopEnd=`expr $idx - 1`
    
    for i in $(seq 2 $loopEnd)  
    do   
        if [ "${name[$i]}" = "$currentname" ];then
            eval "docker image rm ${dockerid[$idx]}"
            return
        fi
    done   
}



size=${#name[*]}
for i in $(seq 2 $size)  
do   
    delexist $i 
done   