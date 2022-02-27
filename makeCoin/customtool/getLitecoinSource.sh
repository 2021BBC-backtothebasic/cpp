#!/bin/bash

echo "작업할 프로젝트 명"
read pjname
echo "대문자 이니셜 4글자"
read initialname


echo "$pjname 프로젝트를 위한 소스를 가져옵니다"
echo $getSource
getSource=$( git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin.git ./${pjname}coin)
