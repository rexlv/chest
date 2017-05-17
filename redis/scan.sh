#!/bin/bash

SERVERLIST=$1
PREFIX=$2

for server in $SERVERLIST; do 
    cursor=0
    while 
        r=`redis-cli -h ${server%:*} -p ${server##*:} scan $cursor match "$PREFIX*" count 1000 `
        cursor=`echo $r | cut -f 1 -d' '`
        nf=`echo $r | awk '{print NF}'`

        if [ $nf -gt 1 ]; then
            for x in `echo $r | cut -f 1 -d' ' --complement`; do 
                echo $x
            done
        fi
        (( $cursor != 0 ))
    do
        :
    done
done