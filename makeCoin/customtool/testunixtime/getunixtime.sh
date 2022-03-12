#!/bin/bash

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
