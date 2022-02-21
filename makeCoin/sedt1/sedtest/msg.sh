#!/bin/bash

echo "코인명입력"
read coinname

#MSG=$( find ./ -type f -readable -writable -exec sed -i 's/Sedcoin/${coinanme}/g' {} \; )

echo ${coinname}
c_split=($(echo $coinname | tr "" "\n"))

echo "split : ${c_split[0]}"

for i in $c_split
do
	echo "글자순으로 " $i "\n"
done

Msg=$( find ./ -type f -readable -writable -exec sed -i "s/Sedcoin/Sedcoin/g" {} \;)


echo "입력값 : '${Msg}'"
