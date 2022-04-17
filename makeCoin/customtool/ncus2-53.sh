#!/bin/bash
echo -e "\n>> 진행할 프로젝트명 입력 (coin 제외하고 입력)"
read pjname

function getInitial {
inits=${pjname^^}
echo -e "\n대문자 이니셜 3자리 입력(기본값: ${inits:0:2}C)"
read initial
if [ -z $initial ]; then inits=${pjname^^} ; initial=${inits:0:2} ; fi
#if [[ $initial == *C* ]] ; then IFS="C"; read -ra j <<< $initial ; initial=${j[0]} unset IFS; fi
if [[ "${initial}" != "${initial:0:2}C" ]] ; then initial="${initial:0:2}C" ; fi #예외가있어서 잠시 보류
initial=${initial^^}
echo -e "\n\n>> 입력값 적용 : ${initial^^} "

echo "1)이대로 진행"
echo "2)다시 입력 "
read reinitialq
case $reinitialq in
	2) getInitial ;;
	*) ;;
esac
}
getInitial


function getKorname {
echo "한글 코인명 입력"
read korname
if [ -z $korname ] ; then korname=${pjname^^} ; fi
echo -e "\n>> 입력값 적용 : $korname코인 \n"

#getKorname
echo "1)이대로 적용"
echo "2)다시 입력"
read reKornameq
case $reKornameq in
	2) getKorname ;;
	*) ;;
esac
}
getKorname


function getUnixtime {
$getClear
echo "GenesisHash key : pszStamp 메시지 입력    ( 기본값 : \"Captain America: Winter Soldier, 2014 Bucky Banres\" )"
read pszStamp
echo -e "적용할 시간 입력 (예시: 2018-12-24 12:30:30)"
read getIntentDate

getunixtime=$( date +%s --date "$getIntentDate" )
if [ -z $getIntentDate ] ; then getIntentDate="2018-12-24 12:30:30" ; fi
if [ -z $pszStamp ] ; then pszStamp="Captain America: Winter Soldier, 2014 Bucky Banres" ; fi

echo -e "\n$pszStamp"
echo -e ">> 입력값 : ${getIntentDate}"
echo -e "Unixtime : $getunixtime"
echo ""
echo "1)이대로 사용"
echo "2)다시 입력"
read retryq
case $retryq in
	2) getUnixtime ;;
	*) ;;
esac
getClear=$( /usr/bin/clear )
}
getUnixtime


echo -e ">> 제네시스 해시값 생성중... 약 10분 소요"
echo $(
cd ${pjname}coin; sudo apt-get install libssl-dev -y ;
git clone https://github.com/lhartikk/GenesisH0; cd GenesisH0;
sudo pip install scrypt construct==2.5.2; 
sudo python2 genesis.py -a scrypt -z "${pszStamp}" -t "${getunixtime}" > ${pjname}genhash.txt;
grep -rl :\ | xargs sed -i 's/:\ /=/g'; # source ${pjname}genhash.txt;

gsource=$(cat ${pjname}genhash.txt) 
OIFS=$IFS
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
	
	IFS=$OIFS

    # chainparams.cpp에 해시값 적용
	echo "test_merkle_hash :" $merkle_hash

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
grep -rl 'if (DynamicMemoryUsage() < sizelimit / 4)' 'src/txmempool.cpp' | xargs sed -i "s/if (DynamicMemoryUsage() < sizelimit \/ 4)/if (DynamicMemoryUsage() < sizelimit \/ ${half_origin})/g" {} \;  ;
grep -rl 'halflife /= 4;' | xargs sed -i "s/halflife \/= 4;/halflife \/= ${life_origin};/g" {} \; ;

grep -rl 'else if (DynamicMemoryUsage() < sizelimit / 2)' 'src/txmempool.cpp' | xargs sed -i "s/if (DynamicMemoryUsage() < sizelimit \/ 2)/if (DynamicMemoryUsage() < sizelimit \/ $((${half_origin} /2)))/g" {} \;  ;
grep -rl 'halflife /= 2;' 'src/txmempool.cpp' | xargs sed -i "s/halflife \/= 2;/halflife \/= $((${life_origin} /2)));/g" {} \;  ;
grep -rl 'halflife /= 9;' | xargs sed -i "s/halflife \/= 9;/halflife \/= 4;/g" {} \; ;
# sed -i "s/halflife \/= 2;/halflife \/= $((${life_origin} \/ 2));/g" {}\; ;
	
)


function magicval {
echo "메인넷 세팅할  MessageStart[0] ASCII값 입력 (기본값 : 0xfd )"
read mmsg0
echo "메인넷 세팅할  MessageStart[1] ASCII값 입력 (기본값 : 0xc2 )"
read mmsg1
echo "메인넷 세팅할  MessageStart[2] ASCII값 입력 (기본값 : 0xb8 )"
read mmsg2
echo "메인넷 세팅할  MessageStart[3] ASCII값 입력 (기본값 : 0xdd )"
read mmsg3

if [ -z $mmsg0 ]; then mmsg0="0xfd" ;     fi
if [ -z $mmsg1 ]; then mmsg1="0xc2" ;     fi
if [ -z $mmsg2 ]; then mmsg2="0xb8" ;     fi
if [ -z $mmsg3 ]; then mmsg3="0xdd" ;     fi

echo "pchMessageStart[0] = ${mmsg0};"
echo "pchMessageStart[1] = ${mmsg1};"
echo "pchMessageStart[2] = ${mmsg2};"
echo "pchMessageStart[3] = ${mmsg3};"

echo "테스트넷 MsgStart[0] ASCII값 입력 (기본값 : 0xff;)"
read tmsg0
echo "테스트넷 MsgStart[1] ASCII값 입력 (기본값 : 0xd4;)"
read tmsg1
echo "테스트넷 MsgStart[2] ASCII값 입력 (기본값 : 0xca;)"
read tmsg2
echo "테스트넷 MsgStart[3] ASCII값 입력 (기본값 : 0xf3;)"
read tmsg3


if [ -z $tmsg0 ]; then tmsg0="0xff" ;     fi
if [ -z $tmsg1 ]; then tmsg1="0xd4" ;     fi
if [ -z $tmsg2 ]; then tmsg2="0xca" ;     fi
if [ -z $tmsg3 ]; then tmsg3="0xf3" ;     fi

echo "pchMessageStart[0] = ${tmsg0};"
echo "pchMessageStart[1] = ${tmsg1};"
echo "pchMessageStart[2] = ${tmsg2};"
echo "pchMessageStart[3] = ${tmsg3};"

echo "1) 이대로 진행"
echo "2) 다시 입력"
read remagicval
case $remagicval in
	2) magicval ;;
	*) ;;
esac
}
magicval

function getPortval {
echo "노드통신에 사용할 '메인넷 포트번호' 입력"
read mainport
echo "노드통신에 사용할 '테스트넷 포트번호(4자리)' 입력"
read testport
echo "RPC통신에 사용할 '메인넷 포트번호(4자리)' 입력"
read mainRPCport
echo "RPC통신에 사용할 '테스트넷 포트번호' 입력"
read testRPCport

echo -e "\n>> 메인넷 노드포트: $mainport\n>> 테스트넷 노드포트 : 1$testport\n>> 메인넷 RPC포트 : $mainRPCport\n>> 테스트넷 RPC포트 : 1$testRPCport\n\n"
echo "1)이대로 진행"
echo "2)다시 입력 "
read reportvalue
case $reportvalue in
	2) getPortval ;;
	*) ;;
esac
}
getPortval

function setting_chainparams {
cd ${pjname}coin/src ; 
echo -e "#ifndef BITCOIN_CHAINPARAMSSEEDS_H\n#define BITCOIN_CHAINPARAMSSEEDS_H\nstatic SeedSpec6 pnSeed6_main[] = {};\nstatic SeedSpec6 pnSeed6_test[] = {};\n#endif" > chainparamsseeds.h

}


echo -e "\nBuild Tool 체크 및 설치중...약 2~5분소요 (프론트엔드 Dialog는 무시)\n"
echo ${getBuildToolsUbuntu}
getBuildToolsUbuntu=$(
sudo apt-get update -y ; sudo apt-get upgrade -y;
sudo apt-get install -y build-essential; 
sudo apt-get install curl -y ;
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash; source ~/.bashrc; nvm install 16.13.2 ; nvm use 16.13.2; 
sudo apt-get install mariadb-server -y ; sudo apt-get install mariadb-client -y; 
sudo dpkg --add-architecture i386; sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'; sudo apt-get install --install-recommends winehq-stable -y; 
sudo apt-get update -y; sudo apt-get upgrade -y ;  
sudo apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git -y ; sudo apt-get install libminiupnpc-dev -y ; sudo apt-get install libminiupnpc-dev -y; sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y; sudo apt-get install libqrencode-dev -y ;
sudo apt-get -y install nsis; sudo apt-get -y install g++-mingw-w64-x86-64; echo "1" | sudo update-alternatives --config x86_64-w64-mingw32-g++;
)


echo -e "\n${pjname}coin 폴더에 0.15 소스를 가져오기.\n"
echo $(git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin.git ./${pjname}coin )

function testformake {
echo $(
	cd ${pjname}coin; git clone https://github.com/eumcloud/makepractice ./sampleparams; mv ./sampleparams/chainparams.cpp ./src/chainparams.cpp; mv ./sampleparams/chainparamsseeds.h ./src/chainparamsseeds.h/; rm -r ./sampleparams/ ;
 )
}
testformake


echo $getClear
echo -e "\n주요 keyword customizing.. 약 3~4분소요"
# echo ${getWordChange}
function putSed {
echo $(
cd ${pjname}coin ; 
#주요 메뉴얼 키워드 변경
find ./ -type f -readable -writable -exec sed -i "s/Litecoin/${pjname^}coin/g" {} \; ;
find ./ -type f -readable -writable -exec sed -i "s/LiteCoin/${pjname^}Coin/g" {} \; ;
find ./ -type f -readable -writable -exec sed -i "s/litecoin/${pjname,,}coin/g" {} \; ;
find ./ -type f -readable -writable -exec sed -i "s/Litecoind/${pjname^}coind/g" {} \; ;
find ./ -type f -readable -writable -exec sed -i "s/LITECOIN/${pjname^^}COIN/g" {} \; ;
find ./ -type f -readable -writable -exec sed -i "s/lites/${pjanem,,}s/g" {} \; ;
grep -r ${pjname^}coin;

#이니셜 및 단위변경
find ./ -type f -readable -writable -exec sed -i "s/LTC/${initial}/g" {} \; ;
find ./ -type f -readable -writable -exec sed -i "s/photons/${pjname:0:1}photons/g" {} \; ;


#한글명
find ./ -type f -readable -writable -exec sed -i "s/라이트코인/${korname}코인/g" {} \; ;
find ./ -type f -readable -writable -exec sed -i "s/라이트/${korname}/g" {} \; ; 

#포트변경
find ./ -type f -print0 | xargs -0 sed -i "s/9333/${mainport}/g" ;
find ./ -type f -print0 | xargs -0 sed -i "s/9332/${mainRPCport}/g" ;
find ./ -type f -print0 | xargs -0 sed -i "s/19335/1${testport}/g"; 
find ./ -type f -print0 | xargs -0 sed -i "s/19332/1${testRPCport}/g";

mv /doc/man/litecoin-cli.1 ./${pjname}coin-cli.1 ;
mv /doc/man/litecoin-qt.1 ./${pjname}coin-qt.1 ;
mv /doc/man/litecoin-tx.1 ./${pjname}coin-tx.1 ;
mv /doc/man/litecoind.1 ./${pjname}coind.1 ;

)




}
# echo $(grep -r "${pjname}coin")
echo -e "\n코인 주요명칭 변경"
echo "Litecoin -> ${pjname^}coin"
echo "LiteCoin -> ${pjname^}Coin"
echo "litecoin -> ${pjname,,}coin"
echo "litecoind -> ${pjname}coind"
echo "LITECOIN -> ${pjname^^}COIN"

echo "LTC -> ${initial:0:2}"
echo "라이트 -> ${korname}"
echo "라이트코인 -> ${korname}코인"

echo -e "\n코인 단위명 변경"
echo "photons -> ${pjname:0:1}photons"

echo -e "\n 파일명 변경"
echo "doc/man/litecoin-cli -> ${pjname}coin-cli"
echo "doc/man/litecoin-qt -> ${pjname}coin-qt"
echo "doc/man/litecoin-tx -> ${pjname}coin-tx"
echo "doc/man/litecoid -> ${pjname}coind"
echo "...."

putSed
echo -e "\n\n>> 변경완료."


echo "Chain Params Seeds 세팅"
echo $(
	echo "chainparamsseeds.h initial.." ;
	cd ${pjname}coin/src ; echo -e "#ifndef BITCOIN_CHAINPARAMSSEEDS_H\n#define BITCOIN_CHAINPARAMSSEEDS_H\nstatic SeedSpec6 pnSeed6_main[] = {};\nstatic SeedSpec6 pnSeed6_test[] = {};\n#endif" > chainparamsseeds.h ;

	echo "replace value of Chainparams.cpp";
	
	
)


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
)