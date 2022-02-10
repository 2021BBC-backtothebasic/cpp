#!/bin/bash

NUMBER=(1 2 3 4)
echo ${NUMBER[*]}

NUMBER+=(5 6 7 8 9 10)

CMD=("ls" "pwd" "ps" "clear" "cp")
echo ${CMD[*]}
ELEMENT="123 456"

CMD+=($ELEMENT)

echo ${CMD[*]}
