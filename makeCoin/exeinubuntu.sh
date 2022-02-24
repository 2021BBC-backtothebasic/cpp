echo "프로젝트명 (영문) 입력"
read pjname


echo -e "\n>> ${pjname}coin 폴더에 원본소스를 clone합니다. "
echo " "

echo ${sourceclcone}
sourceclone=$(git clone -b 0.15 --single-branch https://github.com
/litecoin-project/litecoin.git ./${pjname}coin)

echo -e "\n기본 빌드툴 설치확인 및 설치중.. 약 2분소요"
echo ${buildTool1}
buildTool1=$( sudo apt-get install -y git build-essential libtool
autotools-dev automake pkg-config bsdmainutils python3)
echo "${buildToolupdate}"
echo "${buildUbuntuOnly}"
echo "${DependGuiUbuntu}"

buildToolupdate=$(sudo apt-get -y install build-essential libtool
autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainu
tils libboost-all-dev;
sudo apt-get -y install build-essential libtool autotools-dev auto
make pkg-config libssl-dev libevent-dev bsdmainutils;  sudo apt-ge
t install libboost-all-dev;
)
ildUbuntuOnly=$(
sudo apt-get -y install software-properties-common;
sudo add-apt-repository ppa:bitcoin/bitcoin;
sudo apt-get -y update;
sudo apt-get -y install libdb4.8-dev libdb4.8++-dev;
)
DependGuiUbuntu=$(sudo apt-get -y install libqt5gui5 libqt5core5a
libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protob
uf-compiler; sudo apt-get -y install libqrencode-dev)

echo -e "\n보조 빌드툴 설치확인 및 설치중.. 약 1분 소요."
echo ${buildTool2}
buildTool2=$( sudo apt-get install -y make automake cmake curl g++
-multilib libtool binutils-gold bsdmainutils pkg-config python3 pa
tch)


ho -e "\ndepends make -j 8 실행중... 10분예상 "
echo "${depmake}"
depmake=$( cd ${pjname}coin ; cd depends; make -j 8 )

echo -e "\n\n프로젝트 폴더에서 make진행 "
echo ${mainmake}
mainmake=$(cd ${pjname}coin; ./autogen.sh ; CONFIG_SITE=$PWD/denep
ds/x86_64-pc-linux-gnu/share/config.site ./configure --prefix=/; m
ake -j 8; make install DESTDIR=$PWD/${pjname}_ubuntu_bin/ )



echo -e "\n\n>> ${pjname}coin 폴더의 진행상태를 확인해주세요.\n"
