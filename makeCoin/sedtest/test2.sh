#!/bin/bash

str="Hello"

for ((i=0 ; i< 5; i++)) ; do
	echo "${str:$i:$i+1}"
done


