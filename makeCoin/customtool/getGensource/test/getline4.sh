#!/bin/bash

function gsource {
	getline=`cat getSource.txt`
	for i in $getline
	do
		if [[ $i == *=* ]] ; then			
			sort=`echo $i >> psource.txt`
			$sort
		fi
	done

	thesource=`source psource.txt`
	echo $thesource
	echo $nonce	
}

getline


