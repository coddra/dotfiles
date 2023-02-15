#!/bin/bash

temp=$(sensors | grep "Package id 0:" | tr -d '+' | awk '{print $4}')
echo $(echo $temp | cut -c -$(expr $(expr index '.' $temp) + 1))

