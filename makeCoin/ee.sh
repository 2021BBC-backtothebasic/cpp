echo "주먹구구식 원툴 ver.boost compile 저사양 직렬실행 버전"

echo "프로젝트명을 입력해주세요."

read pjname



PJ=$( #git clone 

echo "---------------- Coin Sourcing....-----------------" && git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin.git ./${pjname}coin )

BOOST=$( #boost

echo "---------------- BoostSetting.....-----------------" && 

	    cd ${pjname}coin && wget https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.gz && tar -zxvf boost_1_78_0.tar.gz && cd boost_1_78_0 && sudo ./bootstrap.sh --prefix=/usr/ --show-libraries && ./b2 runtime-link=static toolset=gcc -d+2 && sudo ./b2 install )

COMM=$(#apt except boost

echo "---------------- Build Setting....-----------------" && 

	    wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - && sudo apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 && sudo apt-get update && sudo apt-get install libssl-dev libevent-dev && sudo apt-get install libminiupnpc-dev && sudo apt-get install libzmq3-dev && sudo apt-get install libqrencode-dev && sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler && sudo apt install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git && sudo apt install g++-mingw-w64-x86-64 && sudo dpkg --add-architecture i386 && sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' )

BERKLEY=$(#Berkley

echo "---------------- BerkleyDB Build..-----------------" && 

	cd ${pjname}coin && wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz && tar -xvf ./db-4.8.30.NC.tar.gz && sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' db-4.8.30.NC/dbinc/atomic.h && cd db-4.8.30.NC && cd build_unix/ && ../dist/configure --disable-shared --enable-cxx --with-pic --prefix=/usr/local/ &&  make -j 8)

PJBUILD=$(

echo "---------------- depends & ${pjname}Coin Build-----------------" && 

	cd ${pjname}coin && PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g') && sudo bash -c "echo 0 > /proc/sys/fs/binfmt_misc/status" &&cd depends && make HOST=x86_64-w64-mingw32 -j 8 && cd .. && ./autogen.sh && CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/ && make -j 8

make install DESTDIR=/${PWD}/litecoin_bin  && make install DESTDIR=/${PWD}/litecoin_bin && mkdir data 

    )



    echo ${PJ}

    echo ${BOOST}

    echo ${COMM}

    echo ${BERKLEY}

    echo ${PJBUILD}

    echo "잘 설치되었는지 확인필요."




