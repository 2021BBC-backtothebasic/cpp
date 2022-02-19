#!/bin/bash


SetUbuntu(){
echo "사용중인 우분투 버전을 입력해주세요"
echo "1. Ubuntu 21.04"
echo "2. Ubuntu 20.10"
echo "3. Ubuntu 20.04, Linux Mint 20.x"
echo "4. Ubuntu 18.04, Linux Mint 19.x"
read VER
case $VER in
    1)UBUNTU_VER=$(sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main' -y);;
    2)UBUNTU_VER=$(sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ groovy main' -y);;
    3)UBUNTU_VER=$(sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y);;
    4)UBUNTU_VER=$(sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' -y);;
    *)UBUNTU_VER= $(sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' -y);;
esac

BUILDSET=$(
sudo dpkg --add-architecture i386  ; ${UBUNTU_VER} ; sudo apt-get clean; sudo apt-get update  -y ; sudo apt-get --allow-unauthenticated upgrade -y ; sudo apt install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl  -y git ; sudo apt install nsis  -y ; sudo apt install g++-mingw-w64-x86-64 -y ; echo "1" | sudo update-alternatives --config x86_64-w64-mingw32-g++ ;
PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g');
sudo bash -c "echo 0 > /proc/sys/fs/binfmt_misc/status";
cd ${pjname}coin; cd depends;
make -j 8 HOST=x86_64-linux-gnu;
cd ..; ./autogen.sh; CONFIG_SITE=$PWD/depends/x86_64-linux-gnu/share/config.site ./configure --prefix=/;
make -j 8; sudo make install DESTDIR=/${PWD}/execute/)

echo "${BUILDSET}"
}


getPj(){
echo "1. 진행하실 프로젝트명을 입력하세요."
read pjname
echo "2. GENESIS Block 메시지를 입력해주세요."
read GENMSG
echo "3. 총 발행량을 입력해주세요.(숫자로 입력. 기본값: 21,000,000)"
read ALLAmount
echo "4. 반감기를 입력해주세요. (단위: 1년, 기본값: 4) "
read REDUCE
echo "5. 로고 이미지 위치를 입력해주세요. (기본값: ./logo)"
read LOGOPATH

PJ=$(
git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin.git ./${pjname}coin;
)
echo ${PJ}
GENESIS=$(cd ${pjname}coin && git clone https://github.com/lhartikk/GenesisH0
cd GenesisH0 ; sudo pip install scrypt construct==2.5.2 ; sudo python2 genesis.py -a scrypt -z "${GENMSG}" -t 1633255502; sudo python2 genesis.py -a scrypt -z "${GENMSG}" -t 1633256610)
echo ${GENESIS}
}

WSLInstall(){
WSLSET=$(sudo apt-get update; sudo apt-get --allow-unauthenticated upgrade -y; sudo apt install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git -y; sudo apt install nsis -y;  sudo apt install g++-mingw-w64-x86-64 -y; echo "1" | sudo update-alternatives --config x86_64-w64-mingw32-g++;)
WSLBUILD=$(PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g') & cd depends ; make HOST=x86_64-w64-mingw32 -j 8; cd .. ; ./autogen.sh ; CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/ ; make install DESTDIR=/${PWD}/${pjname}coin_bin; mkdir data;
make)
}


UnixInstall(){
UNIXSET=$(
sudo apt-get update; sudo apt-get --allow-unauthenticated upgrade -y; sudo apt-get install libssl -y; sudo apt-get install libevent -y; sudo apt-get install miniupnpc -y; sudo apt-get install libdb4.8 -y; sudo apt-get install qt -y; sudo apt-get install protobuf -y; sudo apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 -y; sudo apt-get install libssl-dev libevent-dev; sudo apt-get install libqrencode -y; sudo apt-get install univalue -y; sudo apt-get install libzmq3 -y; sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y;  sudo apt-get install libqrencode-dev -y ; cd ${pjname}coin; wget https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.gz; tar -zxvf boost_1_78_0.tar.gz; cd boost_1_78_0; ./bootstrap.sh --prefix=/usr/; ./b2 runtime-link=static toolset=gcc; sudo ./b2 install; cd .. ; wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz ; tar -xvf ./db-4.8.30.NC.tar.gz; sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' db-4.8.30.NC/dbinc/atomic.h; cd db-4.8.30.NC; cd build_unix/ ; ../dist/configure --disable-shared --enable-cxx --with-pic --prefix=/usr/local/ ; make -j 8; cd ../.. 
)
UNIXBUILD=$(cd ${pjname}coin; ./autogen.sh; CONFIG_SITE=$PWD/depends/x86_64-linux-gnu/share/config.site ./configure --prefix=/; make -j 8; make install DESTDIR=/${PWD}/${pjname}coin_bin/; mkdir data)
echo ${UNIXSET}
echo ${UNIXBUILD}
}

macInstall(){
MACINST=$(brew install automake berkeley-db4 libtool boost miniupnpc openssl pkg-config protobuf python qt libevent qrencode; brew install librsvg;)
MACBUILD=$(cd ${pjname}coin; ./autogen.sh ; ./configure --prefix=/ ; make -j 8; make install DESTDIR=/${PWD}/${pjname}coin_bin; mkdir data;)
echo $(MACINST)
}
CLS=$(/usr/bin/clear)

while true; do
echo " -----------------------------------------------------------------------"
echo " 프로젝트를 진행할 OS를 선택해주세요. (사양에 따라 약 1~3시간이 소요됩니다.)"
echo " git litecoin 메뉴얼대로 실행됩니다. 귀차니즘"
echo " -----------------------------------------------------------------------"
echo " 1. OS Window - WSL"
echo " 2. OS X - Mac"
echo " 3. OS Ubuntu in AWS"
echo " 4. OS Unix "
echo " 5. 종료"
read Selec
case $Selec in
    1)
        echo ${CLS}
        echo "OS window - WSL 입력됨."
        echo " "
        getPj
        WSLInstall
        break
        ;;
    2)
        echo ${CLS}
        echo "OSX - Mac 입력됨."
        echo " "
        echo " 준비중인 서비스입니다. 해적단에 문의하세요."
        sleep 2
        echo " 그냥 진행하시려면 0번을 눌러주세요"
        read PASS
        case $PASS in
            0) 
            getPj
            macInstall
            ;;
            *) break;;
        esac
        
        sleep 2
        echo ${CLS}
        ;;
    3)
        echo ${CLS}
        echo "OS Ubuntu in AWS"
        echo " "
        getPj
        SetUbuntu
        break
        ;;
    4)
        echo ${CLS}
        echo "OS Unix"
        echo " "
        getPj
        UnixInstall
        break
        ;;
    5)
        echo "종료됨."
        sleep 2
        echo ${CLS}
        break
        ;;
    *)
        echo ${CLS}
        echo " 번호를 다시 확인해주세요!!"
        echo " "
        sleep 1
        echo ${CLS}
        ;;
esac
done
