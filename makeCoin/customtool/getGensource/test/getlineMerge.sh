#!/bin/bash

function gsource {
	getline=`cat ${Mkfld}genhash.txt`
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
echo "폴더명 설정"
read Mkfld
echo "Stamp Message"
read Msg
echo "Unixtime Default >> 1645871400"

echo -e "\n>> Making Genesis hash for 10 minuts..."; 

echo ${getSource}
getSource=$(
#ready
sudo apt-get install libssl-dev -y; 
sudo pip install scrypt construct==2.5.2;     
#getSource
git clone https://github.com/lhartikk/GenesisH0 ./${Mkfld} &&  cd ${Mkfld} && 
sudo python2 genesis.py -a scrypt -z "${Msg}" -t "1645871400" > ${Mkfld}genhash.txt && 
find ./ -name "${Mkfld}genhash.txt" -exec sed -i 's/\:\ /\=/g' {} \; &
find ./ -name "${Mkfld}genhash.txt" -exec sed -i 's/genesis\ hash/genesis_hash/g' {} \; &
find ./ -name "${Mkfld}genhash.txt" -exec sed -i 's/merkle\ hash/merkle_hash/g' {} \; &&
getline
)
}


#execute
getSource