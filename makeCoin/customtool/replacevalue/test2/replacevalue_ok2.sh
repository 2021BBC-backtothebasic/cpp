#!/bin/bash

#기본정보값
echo "pjname 입력"
read pjname


#CUSTOM VALUES!!
echo "스탬프 메시지"
read pszStamp

echo "Unixtime"
read getunixtime
if [ -z $getunixtime ] ; then  getunixtime=16000000    ; fi

echo "초기 코인갯수"
read genesisAmount

echo "최소거래를 위한 블럭 갯수 (성숙도)"
read COINBASE_MATURE

echo "총 발행량"
read MAX_AMOUNT

echo "초기 채굴량"
read miningAmount

echo "반감기 설정 (순서대로 : sizelimit, halflife)"
read half_origin
read life_origin
# read half_balance
# read life_balance



#gethash
#생략

#getReady
echo $(
    mkdir ${pjname}coin; cp -r gen.txt ./${pjname}coin/gg.txt ; 
    cp -r ./source/src ./${pjname}coin/ ; cp -r ./source/src/consensus ./${pjname}coin/src;
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
gsource=$(cat gg.txt);

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
getunixtime=$time ;
# chainparams.cpp에 해시값 적용
echo "test_merkle_hash :" $merkle_hash ; 
grep -rl "0x00000000000000000000000000000000000000000000002ebcfe2dd9eff82666" | xargs sed -i "s/0x00000000000000000000000000000000000000000000002ebcfe2dd9eff82666/0x0000000000000000000000000000000000000000000000000000000000000000/g" ; 
grep -rl "0x0000000000000000000000000000000000000000000000000007d006a402163e" | xargs sed -i "s/0x0000000000000000000000000000000000000000000000000007d006a402163e/0x0000000000000000000000000000000000000000000000000000000000000000/g" ; 


#checkpointData Init - del:n:148-163
#지정한 줄 제거하고 첫번째 해시값만 추가할예정
# genesis_hash=123
sed -i 's/{  1500, uint256S("0x841a2965955dd288cfa707a755d05a54e45f8bd476835ec9af4402a2b59a2967")},/{ 0, uint2565()}/g' src/chainparams.cpp  ;
sed -i "s/{ 0, uint2565()}/{ 0, uint2565(\"0x${genesis_hash}\")}/g" "src/chainparams.cpp"  ;
sed -i 's/{  4032, uint256S("0x9ce90e427198fc0ef05e5905ce3503725b80e26afd35a987965fd7e3d9cf0846")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{  8064, uint256S("0xeb984353fc5190f210651f150c40b8a4bab9eeeff0b729fcb3987da694430d70")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{ 16128, uint256S("0x602edf1859b7f9a6af809f1d9b0e6cb66fdc1d4d9dcd7a4bec03e12a1ccd153d")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{ 23420, uint256S("0xd80fdf9ca81afd0bd2b2a90ac3a9fe547da58f2530ec874e978fce0b5101b507")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{ 50000, uint256S("0x69dc37eb029b68f075a5012dcc0419c127672adb4f3a32882b2b3e71d07a20a6")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{ 80000, uint256S("0x4fcb7c02f676a300503f49c764a89955a8f920b46a8cbecb4867182ecdb2e90a")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{120000, uint256S("0xbd9d26924f05f6daa7f0155f32828ec89e8e29cee9e7121b026a7a3552ac6131")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{161500, uint256S("0xdbe89880474f4bb4f75c227c77ba1cdc024991123b28b8418dbbf7798471ff43")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{179620, uint256S("0x2ad9c65c990ac00426d18e446e0fd7be2ffa69e9a7dcb28358a50b2b78b9f709")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{240000, uint256S("0x7140d1c4b4c2157ca217ee7636f24c9c73db39c4590c4e6eab2e3ea1555088aa")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{383640, uint256S("0x2b6809f094a9215bafc65eb3f110a35127a34be94b7d0590a096c3f126c6f364")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{409004, uint256S("0x487518d663d9f1fa08611d9395ad74d982b667fbdc0e77e9cf39b4f1355908a3")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{456000, uint256S("0xbf34f71cc6366cd487930d06be22f897e34ca6a40501ac7d401be32456372004")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{638902, uint256S("0x15238656e8ec63d28de29a8c75fcf3a5819afc953dcd9cc45cecc53baec74f38")},/\/\//g' src/chainparams.cpp ;
sed -i 's/{721000, uint256S("0x198a7b4de1df9478e2463bd99d75b714eab235a2e63e741641dc8a759a9840e5")},/\/\//g' src/chainparams.cpp ;

sed -i "s/{2056, uint256S(\"17748a31ba97afdc9a4f86837a39d287e3e7c7290a08a1d816c5969c78a83289\")},/{ 0, uint2565(\"0x${genesis_hash}\")}/g" "src/chainparams.cpp"  ;


sed -i "s/genesis = CreateGenesisBlock(1317972665, 2084524493, 0x1e0ffff0, 1, 50 * COIN);/genesis = CreateGenesisBlock(${getunixtime}, ${nonce}, 0x1e0ffff0, 1, ${genesisAmount} * COIN);/g" 

grep -rl 'NY Times 05/Oct/2011 Steve Jobs, Apple’s Visionary, Dies at 56' | xargs sed -i "s/NY/${pszStamp}\";\/\//g" ; 
grep -rl "040184710fa689ad5023690c80f3a49c8f13f8d45b8c857fbcbc8bc4a8e4d3eb4b10f4d4604fa08dce601aaf0f470216fe1b51850b4acf21b179c45070ac7b03a9" | xargs sed -i "s/040184710fa689ad5023690c80f3a49c8f13f8d45b8c857fbcbc8bc4a8e4d3eb4b10f4d4604fa08dce601aaf0f470216fe1b51850b4acf21b179c45070ac7b03a9/${pubkey}/g" ; 
# grep -rl '2084524493, 0x1e0ffff0, 1, 50' | xargs sed -i "s/2084524493, 0x1e0ffff0, 1, 50/2084524493, 0x1e0ffff0, 1, ${genesisAmount}/g" ; 
#genesis = CreateGenesisBlock(1317972665, 2084524493, 0x1e0ffff0, 1, 50 * COIN);
# grep -rl "1317972665" | xargs sed -i "s/1317972665/${time}/g" ; 
# grep -rl "2084524493" | xargs sed -i "s/2084524493/${nonce}/g" ; 
grep -rl "0x12a765e31ffd4059bada1e25190f6e98c99d9714d334efa41a195a7e7e04bfe2" | xargs sed -i "s/0x12a765e31ffd4059bada1e25190f6e98c99d9714d334efa41a195a7e7e04bfe2/${genesis_hash}/g" ; 
grep -rl "0x97ddfbbae6be97fd6cdf3e7ca13232a3afff2353e29badfab7f73011edd4ced9" | xargs sed -i "s/0x97ddfbbae6be97fd6cdf3e7ca13232a3afff2353e29badfab7f73011edd4ced9/${merkle_hash}/g" ; 
grep -rl 'vSeeds.emplace_back("seed-a.litecoin.loshan.co.uk", true);' | xargs sed -i 's/vSeeds.emplace_back("seed-a.litecoin.loshan.co.uk", true);/\/\//g' ; 
grep -rl 'vSeeds.emplace_back("dnsseed.thrasher.io", true);' | xargs sed -i 's/vSeeds.emplace_back("dnsseed.thrasher.io", true);/\/\//g' ;
grep -rl 'vSeeds.emplace_back("dnsseed.litecointools.com", true);' | xargs sed -i 's/vSeeds.emplace_back("dnsseed.litecointools.com", true);/\/\//g' ; 
grep -rl 'vSeeds.emplace_back("dnsseed.litecoinpool.org", true);' | xargs sed -i 's/vSeeds.emplace_back("dnsseed.litecoinpool.org", true);/\/\//g' ;
grep -rl 'vSeeds.emplace_back("dnsseed.koin-project.com", false);' | xargs sed -i 's/vSeeds.emplace_back("dnsseed.koin-project.com", false);/vSeeds.clear(); vSeeds.emplace_back("",true);/g' ; 

# 테스트넷 uinixtime
sed -i "s/1516406749/${getunixtime}/g"; 
sed -i "s/794057/0/g"; 

#chainTxData Init
grep -rl '1516406833' | xargs sed -i "s/1516406833/${getunixtime}/g";


#테스트넷 제네시스블럭정보 변경
grep -rl '1486949366' | xargs sed -i "s/1486949366/${getunixtime}/g";
grep -rl '293345' | xargs sed -i "s/293345/${nonce}/g";
grep -rl '0x1e0ffff0, 1, 50' | xargs sed -i "s/0x1e0ffff0, 1, 50/0x1e0ffff0, 1, ${genesisAmount}/g";



#src>consenesus>consensus.h
grep -rl 'COINBASE_MATURITY = 100' 'src/consensus/consensus.h' | xargs sed -i "s/COINBASE_MATURITY = 100/COINBASE_MATURITY = ${COINBASE_MATURE}/g" 'src/consensus/consensus.h' ;
#src>amount.h
grep -rl '84000000' 'src/amount.h' | xargs sed -i "s/84000000/${MAX_AMOUNT}/g" 'src/amount.h' ;
#src>validation.cpp
grep -rl 'CAmount nSubsidy = 50' 'src/validation.cpp' | xargs sed -i "s/CAmount nSubsidy = 50/CAmount nSubsidy = ${miningAmount}/g" 'src/validation.cpp' ;

#src>txmempool.cpp
grep -rl 'if (DynamicMemoryUsage() < sizelimit / 4)' 'src/txmempool.cpp' | xargs sed -i "s/if (DynamicMemoryUsage() < sizelimit / 4)/if (DynamicMemoryUsage() < sizelimit / ${half_origin})/g" ;
sed -i "s/halflife /= 4;/halflife /= ${life_origin};/g" ;

sed -i "s/else if (DynamicMemoryUsage() < sizelimit / 2)/else if (DynamicMemoryUsage() < sizelimit / $((${half_origin} / 2)))/g" ;
sed -i "s/halflife /= 2;/halflife /= $((${life_origin} / 2));/g" ;

)

# $genesisAmount
# $getunixtime
# $COINBASE_MATURE
# $MAX_AMOUNT
# $miningAmount
# $halfSizeLimit
# $sizelimit
# $halfLife