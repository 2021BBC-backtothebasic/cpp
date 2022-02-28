#!/bin/bash

function getSource {
echo "폴더명 설정"
read Mkfld
echo "Stamp Message"
read Msg
echo "Unixtime Default"


getSource=$(
#ready
sudo apt-get install libssl-dev -y; 
sudo pip install scrypt construct==2.5.2;     
#getSource
git clone https://github.com/lhartikk/GenesisH0 ./${Mkfld} &&  cd ${Mkfld} && 
sudo python2 genesis.py -a scrypt -z "${Msg}" -t "1645871400" > ${Mkfld}genhash.txt && 
find ./ -name "${Mkfld}genhash.txt" -exec sed -i 's/\:\ /\=/g' {} \; &
find ./ -name "${Mkfld}genhash.txt" -exec sed -i 's/genesis\ hash/genesis_hash/g' {} \; &
find ./ -name "${Mkfld}genhash.txt" -exec sed -i 's/merkle\ hash/merkle_hash/g' {} \; 
)
}
echo -e "\n>> Making Genesis hash for 10 minuts..."; 
getSource