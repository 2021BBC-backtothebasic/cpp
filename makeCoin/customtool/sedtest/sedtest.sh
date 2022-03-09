#!/bin/bash
echo -e "\n>> 진행할 프로젝트명 입력"
read pjname

inits=${pjname^^}
echo -e "\n대문자 이니셜 3자리 입력(기본값: ${inits:0:3}C)"
read initial


if [ -z $initial ]; then inits=${pjname^^} ; initial=${inits:0:3} ; fi


echo -e "\n${pjname}coin 폴더에 0.15 소스를 가져오기.\n"
echo $(git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin.git ./${pjname}coin)


echo $getClear
echo -e "\n주요 keyword customizing.. 약 3~4분소요"
# echo ${getWordChange}

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
find ./ -type f -readable -writable -exec sed -i "s/photons/${pjname:0:1}photons/g" {} \; 

)

# echo $(grep -r "${pjname}coin")
echo "Litecoin --> ${pjname^}coin"
echo "LiteCoin --> ${pjname^}Coin"
echo "litecoin --> ${pjname,,}coin"
echo "litecoind --> ${pjname}coind"
echo "LITECOIN --> ${pjname^^}COIN"

echo "LTC --> ${initial:0:3}C"
echo "photons --> ${pjname:0:1}photons"
echo "...."
echo -e "\n\n>> 변경완료."