#!/bin/bash

echo "작업명을 입력해주세요"
read pjname

# splitpjname=($(echo $pjname | tr "" "\n"))
# echo "whereis : ${splitpjname[0]} "

arrpjname=$()
for i in $pjname
do
	arrpjname+=(i)
done
echo $arrpjname[0]
#read input
#case $input in
#	1) echo " first"
#		echo " : 


DECHO=$(find ./ -type f -readable -writable -exec sed -i 's/${pjname}coin/${pjname}coin/g' {} \;
find ./ -type f -readable -writable -exec sed -i 's/DailyCoin/DailyCoin/g' {} \;
find ./ -type f -readable -writable -exec sed -i 's/LTC/DLYC/g' {} \;
find ./ -type f -readable -writable -exec sed -i 's/litecoin/dailycoin/g' {}\;
find ./ -type f -readable -writable -exec sed -i 's/LITECOIN/DAILYCOIN/g' {} \;
# find ./ -type f -readable -writable -exec sed -i 's/litecoind/dailycoind/g' {} \;
)

#포트 변경
find . -type f -print0 | xargs -0 sed -i 's/9333/9777/g'  {} \; # P2P port
find . -type f -print0 | xargs -0 sed -i 's/9332/9776/g/' {} \; # RPC port
find . -type f -print0 | xargs -0 sed -i 's/19335/19779/g'  {} \; # P2P port -test net
find . -type f -print0 | xargs -0 sed -i 's/19332/19776/g/'  {} \; # RPC port - test net



#단위변경
find ./ -type f -readable -writable -exec sed -i 's/lites/dailys/g' {} \;
find ./ -type f -readable -writable -exec sed -i 's/photones/dphotoness/g' {} \;
