#!/bin/bash

#기본정보값
echo "pjname 입력"
read pjname

#gethash
#생략

#getReady
echo $(
    mkdir ${pjname}coin; cp -r gen.txt ./${pjname}coin/gg.txt ; 
    cp -r ./source/src ./${pjname}coin/ ; cp -r ./source/consensus ./${pjname}coin/;
    cd ${pjname}coin;  

    #그야말로 빈 seeds빌드를 위한준비
    echo -e "#ifndef BITCOIN_CHAINPARAMSSEEDS_H\n#define BITCOIN_CHAINPARAMSSEEDS_H\nstatic SeedSpec6 pnSeed6_main[] = {};\nstatic SeedSpec6 pnSeed6_test[] = {};\n#endif" > ./src/chainparamsseeds.h ; 
)


function readtestnet { #테스트넷용으로 구분
    echo $(
        cd ${pjname}coin; git clone https://github.com/eumcloud/makepractice ./sampleparams ; 
mv -fv ./sampleparams/chainparams.cpp ./src/ ;
mv -fv ./sampleparams/chainparamsseeds.h ./src/ ; rm -r sampleparams;
    )
}
echo $(
    cd ${pjname}coin;
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
grep -rl "0x00000000000000000000000000000000000000000000002ebcfe2dd9eff82666" | xargs sed -i 's/0x00000000000000000000000000000000000000000000002ebcfe2dd9eff82666/0x0000000000000000000000000000000000000000000000000000000000000000/g' ; 
grep -rl "0x0000000000000000000000000000000000000000000000000007d006a402163e" | xargs sed -i 's/0x00000000000000000000000000000000000000000000002ebcfe2dd9eff82666/0x0000000000000000000000000000000000000000000000000000000000000000/g' ; 
grep -rl "NY Times 05/Oct/2011 Steve Jobs, Apple’s Visionary, Dies at 56" | xargs sed -i 's/0x00000000000000000000000000000000000000000000002ebcfe2dd9eff82666/$pszStamp/g' ; 
grep -rl "040184710fa689ad5023690c80f3a49c8f13f8d45b8c857fbcbc8bc4a8e4d3eb4b10f4d4604fa08dce601aaf0f470216fe1b51850b4acf21b179c45070ac7b03a9" | xargs sed -i 's/0x00000000000000000000000000000000000000000000002ebcfe2dd9eff82666/$pubkey/g' ; 
grep -rl "2084524493, 0x1e0ffff0, 1, 50" | xargs sed -i 's/50/$genesisAmount/g' ; 
grep -rl "1317972665" | xargs sed -i 's/1317972665/$getunixtime/g' ; 
grep -rl "2084524493" | xargs sed -i 's/1317972665/$nonce/g' ; 
grep -rl "0x12a765e31ffd4059bada1e25190f6e98c99d9714d334efa41a195a7e7e04bfe2" | xargs sed -i 's/0x12a765e31ffd4059bada1e25190f6e98c99d9714d334efa41a195a7e7e04bfe2/$genesis_hash/g' ; 
grep -rl "0x97ddfbbae6be97fd6cdf3e7ca13232a3afff2353e29badfab7f73011edd4ced9" | xargs sed -i 's/0x97ddfbbae6be97fd6cdf3e7ca13232a3afff2353e29badfab7f73011edd4ced9/$merkel_hash/g' ; 
grep -rl 'vSeeds.emplace_back("seed-a.litecoin.loshan.co.uk", true);' | xargs sed -i 's///g';

#vseeds clear
grep -rl 'vSeeds.emplace_back("seed-a.' | xargs sed -i 's/vSeeds/#vSeeds/g' ; 
grep -rl 'vSeeds.emplace_back("dnsseed.thrasher.io"' | xargs sed -i 's/vSeeds/#vSeeds/g' ; 
grep -rl 'vSeeds.emplace_back("dnsseed.litecointools.' | xargs sed -i 's/vSeeds/#vSeeds/g' ; 
grep -rl 'vSeeds.emplace_back("dnsseed.litecoinpool.org"' | xargs sed -i 's/vSeeds/#vSeeds/g' ; 
grep -rl 'vSeeds.emplace_back("dnsseed.koin-project.com"' | xargs sed -i 's/vSeeds/#vSeeds/g' ; 
grep -rl 'vSeeds.emplace_back("dnsseed.koin-project.com", false);' | xargs sed -i 's/\;/\;\nvSeeds.clear();\nvSeeds.emplace_back("",true)\;/g' ;
#replace and clear ok 


#chainTxData Init
grep -rl '1516406749' | xargs sed -i 's/1516406749/\ /g';
grep -rl '794057' | xargs sed -i 's/794057/\ /g';
#grep -rl '0.01' | xargs sed -i 's/0.01/0.00/g';


#checkpointData Init - del:n:148-163
#지정한 줄 제거하고 첫번째 해시값만 추가할예정
grep -rl '{  1500, uint256S("0x841a2965955dd288cfa707a755d05a54e45f8bd476835ec9af4402a2b59a2967")},' | xargs sed -i 's/'{  1500, uint256S("0x841a2965955dd288cfa707a755d05a54e45f8bd476835ec9af4402a2b59a2967")},'s/\{/\#/g'; 
grep -rl '{  1500, uint256S("0x841a2965955dd288cfa707a755d05a54e45f8bd476835ec9af4402a2b59a2967")},' | xargs sed -i 's/'{  1500, uint256S("0x841a2965955dd288cfa707a755d05a54e45f8bd476835ec9af4402a2b59a2967")},'s/\{/\#/g'; 



#src>consenesus>consensus.h
grep -rl '100' 'src/consensus/consensus.h' | xargs sed -i 's/100/$COINBASE_MATURE/g'
#src>amount.h
grep -rl '84000000' 'src/amount.h' | xargs sed -i 's/100/$MAX_AMOUNT/g'
#src>validation.cpp
grep -rl "CAmount nSubsidy = 50" 'src/validation.cpp' | xargs sed -i 's/50/$miningAmount/g' 
#src>txmempool.cpp
grep -rl "if (DynamicMemoryUsage() < sizelimit / 4)" 'src/txmempool.cpp' | xargs sed -i 's/50/$halfSizeLimit/g' 
grep -rl "sizelimit / 2" 'src/txmempool.cpp' | xargs sed -i 's/2/$sizelimit/g' 
grep -rl "halflife /= 4;" 'src/txmempool.cpp' | xargs sed -i 's/4/$halfLife/g' 

)

