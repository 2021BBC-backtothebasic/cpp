#!/bin/bash
echo "필요한 요소는 TimeStamp Message, UnixTimeStamp, 그외  기타 nonce, value, bits 등"
echo " "
echo "스탬프 메시지를 입력하세요"
read pszTimestamp

echo "nonce 값 입력(비필수)"
read nonce

echo "지정할 유닉스 타임스탬프 입력 (예시: 20090103)"
read getDate
toUnixT=${getDate} +%s

echo "python -a scrypt -z ${pszTimestamp} -n ${nonce} -t ${toUnixT}"
echo "py scrypt가 실행됩니다."

Command=$( python genesis.py -z "${pszTimes
tamp}" -n ${nonce} -t ${toUnixT})
