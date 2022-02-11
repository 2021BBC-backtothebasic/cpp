#!/bin/bash

number=0

while [ $number -le 2 ] # 'l'ess than or 'e'qual
do
	echo "Number: ${number}"
	(( number++ ))
done

