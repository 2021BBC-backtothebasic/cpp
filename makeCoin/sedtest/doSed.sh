#!/bin/bash

echo "프로젝트명(영문) 입력"
read pjname
echo "프로젝트명(한글) 입력"
read pjnamekor
echo "프로젝트(영문) 이니셜(*네글자 이상)"
read initial

find ./ -type f -writable -readable -exec sed 's/Litecoin/${pjname^}coin/g' {} \;
grep ${pjname^}coin -r 
find ./ -type f -writable -readable -exec sed 's/LiteCoin/${pjname^}Coin/g' {} \;
grep ${pjname^}Coin -r
find ./ -type f -readable -writable -exec sed 's/LTC/${initial^^}/g' {} \;
grep ${initial^^} -r
find ./ -type f -readable -writable -exec sed 's/LITECOIN/${pjname^^}COIN/g' {} \;
grep ${pjname^^}COIN -r
lowercase=${pjname} | tr '[:upper]' '[:lower]'
find ./ -type f -readable -writable -exec sed 's/litecoin/${loercase}coin/g' {} \;
grep ${lowercase}coin -r



