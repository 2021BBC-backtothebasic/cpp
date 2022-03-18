#!/bin/bash

#기본정보값
echo "pjname 입력"
read pjname

#gethash
#생략


echo $(mkdir ${pjname}coin; cp -r gen.txt ./${pjname}coin/gg.txt ; cd ${pjname}coin;  mkdir src;)

echo $(
cd ${pjname}coin; git clone https://github.com/eumcloud/makepractice ./sampleparams ; cPATH=$(pwd); 
mv -fv ./sampleparams/chainparams.cpp ./src/ ;
mv -fv ./sampleparams/chainparamsseeds.h ./src/ ; rm -r sampleparams;

echo -e "#ifndef BITCOIN_CHAINPARAMSSEEDS_H\n#define BITCOIN_CHAINPARAMSSEEDS_H\nstatic SeedSpec6 pnSeed6_main[] = {};\nstatic SeedSpec6 pnSeed6_test[] = {};\n#endif" > ./src/chainparamsseeds.h ; 

cd $cPATH;
gsource=$(cat gg.txt)  ;

for i in $gsource
do
    if [[ $i == *=* ]] ; then			
        #  =을 포함한 줄은 j에 입력
        IFS='=' read -ra j <<< $i
    fi
        ###제네시스 해시값들 인스턴스###
    if [[ $j == *merkle_hash* ]] ; then merkle_hash=${j[1]} ; fi
    if [[ $j == *pszTimestamp* ]] ; then pszTimestamp=${j[1]} ; fi
    if [[ $j == *pubkey* ]] ; then pubkey=${j[1]} ; fi
    if [[ $j == *time* ]] ; then time=${j[1]} ; fi
    if [[ $j == *bits* ]] ; then bits=${j[1]} ; fi
    if [[ $j == *nonce* ]] ; then nonce=${j[1]} ; fi
    if [[ $j == *genesis_hash* ]] ; then genesis_hash=${j[1]} ; fi
done

unset IFS;

# chainparams.cpp에 해시값 적용
echo "test_merkle_hash :" $merkle_hash ; 


find ./src/chainparams.cpp 

)


