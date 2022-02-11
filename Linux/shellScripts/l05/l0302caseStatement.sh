#!/bin/bash

option="${1}"
case ${option} in
	-f) FILE="${2}"
		echo "File name is $FILE"
		;;
	-d) DIR="${2}"
		echo "Directory name is $DIR"
		;;
	*)
		echo "`basename ${0}`" :usage: [-f file] | [-d directory]"
		exit 1 #Command return 0 - to come out the program with status1
		;;
esac
