#!/bin/bash

gsource=`cat getSource.txt`

OIFS=$IFS
function getline {
    IFS="="
    
    for x in $gsource
    do
        echo "$x"
    done

}   

IFS=$OIFS
getline

