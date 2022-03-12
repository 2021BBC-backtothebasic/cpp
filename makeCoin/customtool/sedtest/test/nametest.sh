#!/bin/bash

echo "프로젝트명 입력"
read pjname

if [[ $pjname == *coin* ]] ; then IFS='coin' read -ra j <<< $pjname ; pjname=${j[0]} ; unset IFS; fi 
echo $j
echo ">> $pjname"
