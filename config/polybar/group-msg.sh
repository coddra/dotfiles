#!/bin/bash

cd "$(dirname "$0")"
PIDS=$(cat "./pids/$1")
shift 1

for i in $PIDS
do
	polybar-msg -p $i cmd $@
done
