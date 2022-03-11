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

function getPortval {
echo "노드통신에 사용할 '메인넷 포트번호' 입력"
read mainport
echo "노드통신에 사용할 '테스트넷 포트번호(4자리)' 입력"
read testport
echo "RPC통신에 사용할 '메인넷 RPC포트번호' 입력"
read mainRPCport
echo "RPC통신에 사용할 '테스트넷 RPC포트번호'(4자리) 입력"
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



echo -e "\n${pjname}coin 폴더에 0.15v 소스를 가져오기.\n"
echo $(git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin.git ./${pjname}coin )

function testformake {
echo $(cd ${pjname}coin; 
git clone https://github.com/eumcloud/makepractice ./sampleparams;
mv -fv ./sampleparams/chainparams.cpp ./src/chainparams.cpp; 
mv -fv ./sampleparams/chainparamsseeds.h ./src/chainparamsseeds.h;
rm -r ./sampleparams/ 
 )
}
testformake


echo $getClear


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
# grep -r ${pjname^}coin;

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

mv ./doc/man/litecoin-cli.1 ./doc/man/${pjname}coin-cli.1 ;
mv ./doc/man/litecoin-qt.1 ./doc/man/${pjname}coin-qt.1 ;
mv ./doc/man/litecoin-tx.1 ./doc/man/${pjname}coin-tx.1 ;
mv ./doc/man/litecoind.1 ./doc/man/${pjname}coind.1 ;
)
}

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
echo "photons -> '${pjname:0:1}'photons"

echo -e "\n파일명 변경"
echo "doc/man/litecoin-cli -> ${pjname}coin-cli"
echo "doc/man/litecoin-qt -> ${pjname}coin-qt"
echo "doc/man/litecoin-tx -> ${pjname}coin-tx"
echo "doc/man/litecoid -> ${pjname}coind"
echo "...."
echo -e "\n주요 keyword customizing.. 약 3~4분소요"

putSed
echo -e "\n\n>> 변경완료."


