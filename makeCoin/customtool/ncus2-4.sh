#!/bin/bash
echo $getClear
# echo -e "진행방식 선택"
# echo "1) 고유값 직접입력"
# echo "2) 기본값 설정"
# read CUSTOM



echo -e "\n>> 진행할 프로젝트명 입력"
read pjname

inits=${pjname^^}
echo -e "\n대문자 이니셜 2자리 입력(기본값: ${inits:0:2}C)"
read -N 4 initial
if [ -z $initial ]; then inits=${pjname^^} ; initial=${inits:0:2} ; fi
#if [[ $initial == *"C"* ]] ; then IFS="C" read -ra j <<< $initial ; initial=${j[0]}; unset IFS; fi

echo -e "\n한국어표기 입력('코인'제외,  기본값: 라이트)"
read enkor

if [[ $enkor == *"코인"* ]] ; then  OIFS=$IFS; IFS="코인"; read -ra j <<< $enkor; enkor=${enkor[0]} ; fi
echo -e "\n 입력값 : ${enkor}"

#function Inputs{
    echo -e "\n변경할 메인넷 포트번호 "
    read mainport
    if [ -z $mainport ]; then mainport="9776"  ;     fi
    echo -e ">> 입력값 : ${mainport}\n\n"

    echo -e "\n변경할 테스트넷 포트번호 "
    read testport
    if [ -z $testport ]; then     testport="9776" ;    fi
    echo -e ">> 입력값 : ${testport} \n\n"

    echo -e "\n제네시스블럭에 타임스탬프 메시지 입력 (기본값 : I'm StarLoad!!!)"
    read thestamp
    if [ -z $thestamp ]; then  thestamp="I'm StarLoad!!!" ;    fi
    echo -e ">> 입력값 : ${thestamp}\n\n"

    echo -e "\n제네시스블럭에 지정할 시간 (기본값: 현재시간)"
    read gtime
    if [ -z $gtime ]; then 
    gdate=$(date +%s)
    gtime=$gdate 
    fi

    gtime="${gtime:0:4}-${gtime:4:2}-${gtime:6:2} ${gtime:8:2}:${gtime:10:2}:${gtime:12:2}"
    echo $gtime
    ########## gtime=$(date --date=$gtime +%s) 해결필요 ########
    echo -e ">> 입력값 : ${gtime} \n\n"
    if [ -z $gtime ] ; then getunixtime="1645871400" ; fi 

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

#} # end of Realcustom FUNCTION


if [ -z $mmsg0 ]; then mmsg0="0xfd" ; fi
if [ -z $mmsg1 ]; then mmsg1="0xc2" ; fi
if [ -z $mmsg2 ]; then mmsg2="0xb8" ; fi
if [ -z $mmsg3 ]; then mmsg3="0xdd" ; fi
if [ -z $tmsg0 ]; then tmsg0="0xff" ; fi
if [ -z $tmsg1 ]; then tmsg1="0xd4" ; fi
if [ -z $tmsg2 ]; then tmsg2="0xca" ; fi
if [ -z $tmsg3 ]; then tmsg3="0xf3" ; fi

echo -e "\n${pjname}coin 폴더에 0.15 소스를 가져옵니다."
echo ${getSource}
getSource=$(git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin.git ./${pjname}coin)


#echo $getClear
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

echo $getClear
echo -e "\n주요 keyword customizing.. 약 5분소요"
echo "Litecoin --> ${pjname^}coin"
echo "LiteCoin --> ${pjname^}Coin"
echo "litecoin --> ${pjname,,}coin"
echo "litecoind --> ${pjname}coind"
echo "LITECOIN --> ${pjname^^}COIN"

echo "LTC --> ${initial:0:2}C"
echo "photons --> ${pjname:0:1}photons"
echo "...."


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
find ./ -type f -readable -writable -exec sed -i "s/LTC/${initial}C/g" {} \; ;
find ./ -type f -readable -writable -exec sed -i "s/photons/${pjname:0:1}photons/g" {} \; ;

#한글변경
find ./ -type f -readable -writable -exec sed -i "s/라이트코인/${enkor}코인/g" {} \; ;
find ./ -type f -readable -writable -exec sed -i "s/라이트/${enkor}/g" {} \; ;

#포트변경
find ./ -type f -print0 | xargs -0 sed -i "s/9333/${mainport}/g" ;
find ./ -type f -print0 | xargs -0 sed -i "s/9332/${mainport}/g" ;
find ./ -type f -print0 | xargs -0 sed -i "s/19335/1${testport}/g"; 
find ./ -type f -print0 | xargs -0 sed -i "s/19332/1${testport}/g";
)

echo $getClear
echo -e ">> 제네시스 해시값 생성중... 약 10분 소요"
echo $(
cd ${pjname}coin; sudo apt-get install libssl-dev -y ;
git clone https://github.com/lhartikk/GenesisH0; cd GenesisH0;
sudo pip install scrypt construct==2.5.2; 
sudo python2 genesis.py -a scrypt -z "${thestamp}" -t "${getunixtime}" > ${pjname}genhash.txt;
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
	echo "merkle_hash :" $merkle_hash
	IFS=$OIFS

    # chainparams.cpp에 해시값 적용
    
)


echo "Chain Params Seeds 초기화"
echo $(
cd ${pjname}coin/src ; cp -rfv ./chainparamsseeds.h ./backup_chainparamsseeds.h; echo -e "#ifndef BITCOIN_CHAINPARAMSSEEDS_H\n#define BITCOIN_CHAINPARAMSSEEDS_H\nstatic SeedSpec6 pnSeed6_main[] = {};\nstatic SeedSpec6 pnSeed6_test[] = {};\n#endif" > chainparamsseeds.h
)

echo " checkpointData 백업 및 초기화 "
echo $(
cd ${pjname}coin/src ; cp -rfv ./chainparams.cpp ./backup_chainparams.cpp 
# 내용수정 작업 필요 


)

echo -e "\nRPC통신 Api 세팅중... 약 5분 소요"
echo $(
cd ${pjname}coin; mkdir rpc-server; cd rpc-server; npm i -g nodemon dotenv express express-generator ; express --view=pug rpcapi;  mkdir api ; cd api
)

case $CUSTOM in
    1) echo -e "커스텀 코인 시작"
    Inputs 
    ;;
    
    *) echo -e "\n>>자동으로 기본값 입력"
    ;;
esac

echo "THE END"
getClear="$( /usr/bin/clear )"
