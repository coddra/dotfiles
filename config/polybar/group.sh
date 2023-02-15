#!/bin/bash

cd "$(dirname "$0")"
if [[ $1 -eq "--add" ]]; then
	pidof polybar | awk "{ for (i=$2; i>0; i--) print(\$i) }" >> ./pids/$3
else
	pidof polybar | awk "{ for (i=$1; i>0; i--) print(\$i) }" > ./pids/$2
fi
