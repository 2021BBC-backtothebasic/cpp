#!/bin/bash

VAR="Metallica is World best thrash metal"
DISTRO=($VAR)
echo ${DISTRO[1]}

TODAY=(`date`)
echo ${TODAY[*]}

INFO=`uname -a`
echo ${INFO[1]}
