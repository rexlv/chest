#!/usr/bin/env sh

SERVER=${1%:*}
PORT=${1##*:}
echo $SERVER : $PORT
redis-cli -h $SERVER -p $PORT cluster nodes | grep master | awk '{print $2}' | sed 's/:.*//'

