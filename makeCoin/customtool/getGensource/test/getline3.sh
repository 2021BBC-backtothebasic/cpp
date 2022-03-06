#!/bin/bash

function getline {
	gsource=$(cat getSource.txt)
	OIFS=$IFS
	for i in $gsource
	do
		if [[ $i == *=* ]] ; then			
			#  =을 포함한 줄은 j에 입력
			IFS='=' read -ra j <<< $i
		fi
			#제네시스 해시값들 인스턴스
		if [[ $j == *merkle_hash* ]] ; then merkle_hash=${j[1]}
		fi
		if [[ $j == *pszTimestamp* ]] ; then pszTimestamp=${j[1]}
		fi
		if [[ $j == *pubkey* ]] ; then pubkey=${j[1]}
		fi
		if [[ $j == *time* ]] ; then time=${j[1]}
		fi
		if [[ $j == *bits* ]] ; then bits=${j[1]}
		fi
		if [[ $j == *nonce* ]] ; then nonce=${j[1]}
		fi
		if [[ $j == *genesis_hash* ]] ; then genesis_hash=${j[1]}
		fi
	done
	echo "merkle_hash :" $merkle_hash
	IFS=$OIFS
}

getline


