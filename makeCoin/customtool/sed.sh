
echo "pjname 입력"
read pjname
echo "프로젝트 4글자 이니셜"
read initialname


echo "test 샘플 cp -f ./test.txt ./test/test.txt"
echo ${testcp}
testcp=$( cp -f ../test.txt ./test.txt; )
echo "Litecoin --> ${pjname^}coin 으로 변경"
echo "LiteCoin --> ${pjname^}${coinstring^}으로 변경"
echo "litecoin --> ${pjname}coin 으로 변경"
echo "LITECOIN --> ${pjname^^}C로 변경"
echo "lites --> ${pjname}s 로 변경"
coinstring="coin"
echo " char[0]slice ${pjname:0:1}"
seds=$( 
find ./ -type f -readable -writable -exec sed -i "s/Litecoin/${pjname^}coin/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/LiteCoin/${pjname^}${coinstring^}/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/litecoin/${pjname}coin/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/litecoind/${pjname}coind/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/LITECOIN/${pjname^^}COIN/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/lites/${pjname}s/g" {} \;
)
photons=$( find ./ -type f -readable -writable -exec sed -i "s/LTC/${initialname^^}/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/photons/${pjname:0:1}photons/g" {} \;)

