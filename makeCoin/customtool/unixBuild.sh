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

#echo -e "\n>> ${initial}"

function getSource {
 echo $(
	git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin ./${pjname}coin
)
}
function buildset {
echo $( cd "${pjname}coin" ; 
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils -y ;
 sudo apt-get install libboost-all-dev -y;
sudo apt-get install software-properties-common -y ;
sudo add-apt-repository ppa:bitcoin/bitcoin -y ;
sudo apt-get update -y ;
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y ;
sudo apt-get install libminiupnpc-dev -y; 
sudo apt-get install libzmq3-dev ;
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y ;
sudo apt-get install libqt4-dev libprotobuf-dev protobuf-compiler -y;
sudo apt-get install libqrencode-dev -y;

)
}

function setBerkeleyDB {
echo -e "\n>> Berkeley DB make set.."

echo $(
cd "${pjname}coin"; 
LITECOIN_ROOT=$(pwd) ;

# Pick some path to install BDB to, here we create a directory within the litecoin directory
BDB_PREFIX="${LITECOIN_ROOT}/db4" ;
mkdir -p $BDB_PREFIX ;

# Fetch the source and verify that it is not tampered with
wget 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz' ;
echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c ;
# -> db-4.8.30.NC.tar.gz: OK
tar -xzvf db-4.8.30.NC.tar.gz ;

# Build the library and install to our prefix
cd db-4.8.30.NC/build_unix/ ;
#  Note: Do a static build so that it can be embedded into the executable, instead of having to find a .so at runtime
../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$BDB_PREFIX ;
make install; 

# Configure Litecoin Core to use our own-built instance of BDB
cd $LITECOIN_ROOT ;
./autogen.sh ;
./configure LDFLAGS="-L${BDB_PREFIX}/lib/" CPPFLAGS="-I${BDB_PREFIX}/include/"  ; # (other args...)
make -j 8; 
)
}

function getMakeInstall {
echo -e "\n>> 이제부터 make를 시작합니다. 약 20분 소요"
echo $(
cd ${pjname}coin ;
mkdir execute_unix;
make install DESTDIR=$PWD/execute_unix;
)
}


# getSource && BuildTool SET
getSource
buildset
setBerkeleyDB
getMakeInstall
