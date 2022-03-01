#!/bin/bash

echo "폴더명 설정"
read pjname
echo "Stamp Message"
read Msg
echo "Unixtime Default >> 1645871400"




function gsource {
	echo `cd ${pjname} ; touch psource.txt`
	getline=`cat ${pjname}genhash.txt`
	for i in $getline
	do
		if [[ $i == *=* ]] ; then			
			sort=`echo $i >> psource.txt`
			$sort
		fi
	done

	thesource=`source psource.txt`
	echo $thesource
	
}

function getSource {

echo ${getSource}
getSource=$(
#ready
sudo apt-get install libssl-dev -y; 
sudo pip install scrypt construct==2.5.2;     
#getSource
git clone https://github.com/lhartikk/GenesisH0 ./${pjname} &&  cd ${pjname} && 
sudo python2 genesis.py -a scrypt -z "${Msg}" -t "1645871400" > ${pjname}genhash.txt && 
find ./ -name "${pjname}genhash.txt" -exec sed -i 's/\:\ /\=/g' {} \; &&
find ./ -name "${pjname}genhash.txt" -exec sed -i 's/genesis\ hash/genesis_hash/g' {} \; &
find ./ -name "${pjname}genhash.txt" -exec sed -i 's/merkle\ hash/merkle_hash/g' {} \; 

)
}

echo -e "\n>> Making Genesis hash for 10 minuts..."; 

#execute
getSource

echo -e "\n>> 해시값 추출"
gsource

echo -e "\n>> 특정파일에 값 변경"
execute=`find ./ -name "test.txt" -exec sed -i 's/ddde/0x1234/g' {} \; `
echo $execute