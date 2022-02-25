
echo "pjname 입력"
read pjname
echo "프로젝트 4글자 이니셜"
read initialname

echo "Litecoin --> ${pjname^}coin 으로 변경"
echo "LiteCoin --> ${pjname^}${coinstring^}으로 변경"
echo "litecoin --> ${pjname}coin 으로 변경"
echo "LITECOIN --> ${pjname^^}C로 변경"
echo "lites --> ${pjname}s 로 변경"
coinstring="coin"
slice=$(${pjname:0:1})
echo ${slice}
seds=$( ./ -type f -readable -writable -exec sed -i "s/Litecoin/${pjname^}coin/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/LiteCoin/${pjname^}${coinstring^}/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/litecoin/${pjname}coin/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/abcdefcoind/${pjname}coind/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/LITECOIN/${pjname^^}/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/lites/${pjname}s/g" {} \;)
phonos=$( ./ -type f -readable -writable -exec sed -i "s/ABCDEF/${initialname^^}/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/photons/photons/g" {} \;)

