#!/bin/bash

function getline {
	gsource=`cat getSource.txt`


	for i in $gsource
	do
		if [[ $i == *=* ]] ; then			
			echo $i
			IFS='=' read -ra j <<< $i
			`$i[0]=$i[1]`
			echo $i[0]
		fi
	done
	
}

getline

echo $genesis_hash
