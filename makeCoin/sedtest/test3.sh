#!/bin/bash


echo "프로젝트명(영문) 입력"
read pjname

firstUpper=${pjname:0:1}
echo ${firstUpper}

echo " " 
echo "${pjname^}"
echo "${pjname^^}"

