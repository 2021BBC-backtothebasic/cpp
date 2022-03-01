#!/bin/bash

function getline {
	gsource=`cat getSource.txt`


	for i in $gsource
	do
		if [[ $i == *=* ]] ; then
				
			
			
			echo $i
		fi
	done
	
}

getline

echo $genesis_hash
