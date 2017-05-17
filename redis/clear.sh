#!/usr/bin/env sh
PREFIX="$2"
SERVER=${1%:*}
PORT=${1##*:}

CMD="redis-cli -h $SERVER -p $PORT"

./scan.sh $1 $2 | while read -r KEY ; do
    $CMD del $KEY 
done