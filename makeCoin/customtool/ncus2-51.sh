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
    
)
echo "merkle_hash :" $merkle_hash

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
cd ${pjname}coin/src ; cp -rfv ./chainparamsseeds.h ./backup_chainparamsseeds.h; echo -e "#ifndef BITCOIN_CHAINPARAMSSEEDS_H\n#define BITCOIN_CHAINPARAMSSEEDS_H\nstatic SeedSpec6 pnSeed6_main[] = {};\nstatic SeedSpec6 pnSeed6_test[] = {};\n#endif" > chainparamsseeds.h

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