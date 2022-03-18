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


grep -r 

)

#104번줄
consensus.nMinimumChainWork = uint256S("0x00000000000000000000000000000000000000000000002ebcfe2dd9eff82666");
>>
consensus.nMinimumChainWork = uint256S("0x0000000000000000000000000000000000000000000000000000000000000000");

#211번줄
consensus.nMinimumChainWork = uint256S("0x0000000000000000000000000000000000000000000000000007d006a402163e");
>>
consensus.nMinimumChainWork = uint256S("0x0000000000000000000000000000000000000000000000000000000000000000");


51번줄
const char* pszTimestamp = "NY Times 05/Oct/2011 Steve Jobs, Apple’s Visionary, Dies at 56";
>>
const char* pszTimestamp = "$pszStamp";


52번줄
const CScript genesisOutputScript = CScript() << ParseHex("040184710fa689ad5023690c80f3a49c8f13f8d45b8c857fbcbc8bc4a8e4d3eb4b10f4d4604fa08dce601aaf0f470216fe1b51850b4acf21b179c45070ac7b03a9") << OP_CHECKSIG;
>>
pubkey


#121번줄
genesis = CreateGenesisBlock(1317972665, 2084524493, 0x1e0ffff0, 1, 50 * COIN);
>>
genesis = CreateGenesisBlock($getunixtime, $nonce, 0x1e0ffff0, 1, $genesisAmount * COIN);

#123번줄
assert(consensus.hashGenesisBlock == uint256S("0x12a765e31ffd4059bada1e25190f6e98c99d9714d334efa41a195a7e7e04bfe2"));
>>
$genesis_hash

#124번줄
assert(genesis.hashMerkleRoot == uint256S("0x97ddfbbae6be97fd6cdf3e7ca13232a3afff2353e29badfab7f73011edd4ced9"));
>>
$merkle_hash


#127-131번줄
vSeeds.emplace_back("seed-a.litecoin.loshan.co.uk", true);
vSeeds.emplace_back("dnsseed.thrasher.io", true);
vSeeds.emplace_back("dnsseed.litecointools.com", true);
vSeeds.emplace_back("dnsseed.litecoinpool.org", true);
vSeeds.emplace_back("dnsseed.koin-project.com", false);
>>
/***주석 또는 제거 ***/
vSeeds.clear();
vSeeds.emplace_back("",true);

#148-163번줄 제거
>>
{ 0, uint2565($genesis_hash)}

#169번줄 chainTxData
1516406833
>>
$getunixtime


##테스트넷
#225-228번줄
#genesis = CreateGenesisBlock(1486949366, 293345, 0x1e0ffff0, 1, 50 * COIN);
1486949366 >> $getunixtime 
293345 >> $nonce
50 >> $miningamount

252번줄
{2056, uint256S("0x17748a31ba97afdc9a4f86837a39d287e3e7c7290a08a1d816c5969c78a83289")},
>>
0x$genesis_hash

258번줄
1516406749 >> $test_time
794057 >> 0
0.01 >> 0.00


# src>consensus>consensus.h
static const int COINBASE_MATURITY = 100;
>> 
5

# src>amount.h
static const CAmount MAX_MONEY = 84000000 * COIN;
>>
$MAX_AMOUNT

#src>validation.cpp
CAmount nSubsidy = 50
>>
grep -r "CAmount nSubsidy = 50" | xargs sed -i 's/50/$miningAmount/g' 


#src>txmempool.cpp 반감기
if (DynamicMemoryUsage() < sizelimit / 4)
>> $halfSizeLimit

sizelimit / 2
>> grep -r "sizelimit / 2 " | xargs sed -i 's/2/$sizelimit/g'


halflife /= 4;
>> $halfLife

# src>qt>res>icon 그림파일
# bitcoin.ico
# bitcoin.png
# litecoin_splash.png
