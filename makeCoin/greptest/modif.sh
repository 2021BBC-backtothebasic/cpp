#!/bin/bash

echo "수정하고자 하는 타깃값 입력"
read target

echo "수정할 값"
read value

plz1=$(grep "${target}" * -rl | xargs sed -i 's/${target}/${value}/g')
echo ${plzl}
echo "grep ${target} * -rl | xargs sed -i 's/${target}/${value}/g'"
