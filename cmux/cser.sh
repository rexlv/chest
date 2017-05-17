grep -v '#' $HOME/serverlist | awk -F: '{printf "\x1b[31m%20s\x1b[0m: %s\n", $1, $2}'
