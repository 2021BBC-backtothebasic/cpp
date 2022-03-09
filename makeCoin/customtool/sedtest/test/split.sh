#!/bin/bash

i=$(cat change.txt)

if [[ $i == *"코인"* ]]; then
OIFS=$IFS
IFS="코인"
read -ra j <<< $i
i=${j[0]}
echo $i
IFS=$OIFS
fi