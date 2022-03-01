#!/bin/bash

echo "폴더명 설정"
read pjname
echo "Stamp Message"
read Msg
echo "Unixtime Default >> 1645871400"


function getSource {

echo ${getSource}
getSource=$(
#ready
sudo apt-get install libssl-dev -y; 
sudo pip install scrypt construct==2.5.2;     
#getSource

git clone https://github.com/lhartikk/GenesisH0 ./${pjname} && cd ${pjname} && 
sudo python2 genesis.py -a scrypt -z "${Msg}" -t "1645871400" > ./genhash.txt && 
find ./ -name "genhash.txt" -exec sed -i 's/\:\ /\=/g' {} \; &&
find ./ -name "genhash.txt" -exec sed -i 's/genesis\ hash/genesis_hash/g' {} \; &
find ./ -name "genhash.txt" -exec sed -i 's/merkle\ hash/merkle_hash/g' {} \; ;

touch ${pjname}GenSource.txt &&
getline=$(cat ./genhash.txt) &&
for i in $getline
do
    if [[ $i == *=* ]] ; then			
        sort=$(echo $i >> ${pjname}GenSource.txt)
        $sort
    fi
done &&
echo $(source ${pjname}GenSource.txt) && 
echo $($genesis_hash > ../${pjname}test.txt)
)
}

echo -e "\n>> Making Genesis hash for 10 minuts..."; 

#execute
getSource
