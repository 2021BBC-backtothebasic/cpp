#!/bin/bash

echo "프로젝트명 입력"
read pjname

inis=${pjname^^}
initial="${inis:0:3}C"
echo "대문자 이니셜 4글자 입력 (기본값 : ${initial})"
read initial
initial=${initial^^}
initial="${initial:0:3}C"

if [ -z $initial ]; then
  initial=${pjname^^}
  initial="${initial:0:3}C"
fi

function BuildType {
  read makechoice
  case $makechoice in
    2) buildtype="x86_64-w64-mingw32" 
    ;;
    *) buildtype="x86_64-linux-gnu" 
    ;;
  esac

}

function getSource {
 echo $(
	git clone -b 0.15 --single-branch https://github.com/livecoin-project/livecoin ./${pjname}coin
)
}
function buildset {
echo $( cd "${pjname}coin" ; 
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils -y ;
 sudo apt-get install libboost-all-dev -y;
sudo apt-get install software-properties-common -y ;

sudo apt-get update -y ;
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y ;
sudo apt-get install libminiupnpc-dev -y; 
sudo apt-get install libzmq3-dev ;
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y ;
sudo apt-get install libqt4-dev libprotobuf-dev protobuf-compiler -y;
sudo apt-get install libqrencode-dev -y;

)
}

function customize {
echo "메인넷 P2P포트"
read MainP2Pport
echo "메인넷 PRC포트"
read MainPRCport
echo "테스트넷 P2P포트"
read TestP2Pport
echo "테스트넷 PRC포트"
read TestPRCport

if [ -z $MainP2Pport ] ; then MainP2Pport="9777" 
fi
if [ -z $MainPRCport ] ; then MainPRCport="9776" 
fi
if [ -z $TestP2Pport ] ; then TestP2Pport="19777" 
fi
if [ -z $TestPRCport ] ; then TestPRCport="19776" 
fi
echo $(
find ./ -type f -writable -readable -exec sed -i 's/Livecoin/${pjname^}coin/g' {} \; &&
find ./ -type f -writable -readable -exec sed -i 's/LiveCoin/${pjname^}Coin/g' {} \; &&
find ./ -type f -writable -readable -exec sed -i 's/LIVECOIN/${pjname^^}COIN/g' {} \; && 
find ./ -type f -writable -readable -exec sed -i 's/livecoin/${pjname,,}coin/g' {} \; &&
find ./ -type f -writable -readable -exec sed -i 's/livCC/${initial^^}/g' {} \; &&
find ./ -type f -writable -readable -exec sed -i 's/s/${pjname,,}s/g' {} \; &&
find ./ -type f -writable -readable -exec sed -i 's/lphotons/${pjname:0:1}lphotons/g' {} \; 

find ./ -type f -writable -readable -exec sed -i 's//${MainP2Pport}/g' {} \; && #Main P2P
find ./ -type f -writable -readable -exec sed -i 's//${MainPRCport}/g' {} \; && #Main RPC
find ./ -type f -writable -readable -exec sed -i 's/1/${TestP2Pport}/g' {} \; && #Test P2P
find ./ -type f -writable -readable -exec sed -i 's/1/${TestPRCport}/g' {} \; && #Test RPC

find ./ -type f -writable -readable -exec sed -i 's/1/${TestPRCport}/g' {} \; && #Magic
find ./ -type f -writable -readable -exec sed -i 's/1/${TestPRCport}/g' {} \; && #Magic
find ./ -type f -writable -readable -exec sed -i 's/1/${TestPRCport}/g' {} \; && #Magic
find ./ -type f -writable -readable -exec sed -i 's/1/${TestPRCport}/g' {} \;  #Magic


)
}
function setBerkeleyDB {
echo -e "\n>> Berkeley DB make set.."

echo $(
cd "${pjname}coin"; make clean; 
LIVECOIN_ROOT=$(pwd) ;

# Pick some path to install BDB to, here we create a directory within the livecoin directory
BDB_PREFIX="${LIVECOIN_ROOT}/db4" ;
mkdir -p $BDB_PREFIX ;

# Fetch the source and verify that it is not tampered with
wget 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz' &&
echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c &&
# -> db-4.8.30.NC.tar.gz: OK
tar -xzvf db-4.8.30.NC.tar.gz &&

# Build the library and install to our prefix
cd db-4.8.30.NC/build_unix/ &&
#  Note: Do a static build so that it can be embedded into the executable, instead of having to find a .so at runtime
../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$BDB_PREFIX &&
make install && cd .. && cd depends ; make -j 8 ;#HOST=x86_64-linux-gnu;

# Configure Livecoin Core to use our own-built instance of BDB
cd $LIVECOIN_ROOT ;
./autogen.sh ;
./configure LDFLAGS="-L${BDB_PREFIX}/lib/" CPPFLAGS="-I${BDB_PREFIX}/include/"  ; # (other args...)
make -j 8; 
)
}

function VmUbuntuSet {
echo $(
  sudo apt-get install g++-arm-linux-gnueabihf curl -y;
  cd ${pjname}coin ; 
  cd depends ; make HOST=arm-linux-gnueabihf  ; cd .. ;
./autogen.sh ; 
./configure --prefix=$PWD/depends/arm-linux-gnueabihf --enable-glibc-back-compat --enable-reduce-exports LDFLAGS=-static-libstdc++
make -j 8 ; 
)
}

function getMakeInstall {
echo -e "\n>> 이제부터 make를 시작합니다. 약 40분 소요"
echo $(
cd ${pjname}coin ; 
PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g'); #for window
cd depends; make -j 8 HOST=$buildtype; 
cd .. ; ./autogen.sh && CONFIG_SITE=$PWD/depends/$buildtype/share/config.site ./configure --prefix=/ && make -j 8 && make install DESTDIR=$PWD/execute_type_${buidtype};
)
}



# getSource && BuildTool SET
getSource
buildset
#setBerkeleyDB
getMakeInstall
