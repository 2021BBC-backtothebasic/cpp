#!/bin/bash

function getUnixtime {
$getClear
echo "GenesisHash key =pszStamp 메시지 입력    ( 기본값 =\"Captain America=Winter Soldier, 2014 Bucky Banres\" )"
read pszStamp
echo -e "적용할 시간 입력 (예시=2018-12-24 12:30:30)"
read getIntentDate

getunixtime=$( date +%s --date "$getIntentDate" )
if [ -z $getIntentDate ] ; then getIntentDate="2018-12-24 12:30:30" ; fi
if [ -z $pszStamp ] ; then pszStamp="Captain America=Winter Soldier, 2014 Bucky Banres" ; fi

echo -e "\n$pszStamp"
echo -e ">> 입력값 =${getIntentDate}"
echo -e "Unixtime =$getunixtime"
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

# cd ${pjname}coin; sudo apt-get install libssl-dev -y ;
# git clone https://github.com/lhartikk/GenesisH0; cd GenesisH0;
# sudo pip install scrypt construct==2.5.2; 
# sudo python2 genesis.py -a scrypt -z "${pszStamp}" -t "${getunixtime}" > ${pjname}genhash.txt;
grep -rl :\ | xargs sed -i 's/:\ /=/g'; # source ${pjname}genhash.txt;

gsource=$(cat gen.txt) 
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