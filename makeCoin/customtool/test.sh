#!/bin/bash

ints="20220226095056"

echo $cvt
cvt=$( date -d ${ints:4:2}/${ints:6:2}/${ints:0:4} ${ints:8:2}:${ints:10:2}:${ints:12:2} +"%s")

