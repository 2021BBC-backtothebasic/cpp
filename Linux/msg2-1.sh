echo " 프로젝트명을 입력해주세요! >>"
read pjname


BASICSET=$(echo "aws-ubuntu buildset start..."; sudo apt-get update && sudo apt-get upgrade && sudo apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 && sudo apt-get install libssl-dev libevent-dev  && sudo apt-get install libzmq3-dev && sudo apt-get install libqrencode-dev)

GITCLONE=$(echo "${pjname}coin INITIALIZE" & git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin.git ./${pjname}coin )

BOOSTSET=$(echo "check boost compiler" & wget https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.gz && tar -zxvf boost_1_78_0.tar.gz && cd boost_1_78_0 && ./bootstrap.sh --prefix=/usr/ && echo "./bootstrap.sh --prefix 작업완료 ==> ./b2 runtime-link=static toolset=gcc" && ./b2 runtime-link=static toolset=gcc && echo "==>./b2 install" && sudo ./b2 install )
BERKLYDB=$(echo "BERKLY DB Building..." & cd ${pjname} && wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz && tar -xvf ./db-4.8.30.NC.tar.gz && sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' db-4.8.30.NC/dbinc/atomic.h && cd db-4.8.30.NC && cd build_unix && ../dist/configure --disable-shared --enable-cxx --with-pic --prefix=/usr/local/ && echo "약간의 시간 소요.." && make -j 4 && cd ../.. && echo "BerkelyDB까지" )

MINSTALL=$(echo "AWS 프리티어기준 약2시간.. 사양에따라 30분내외 " &make install DESTDIR=/${PWD}/data && echo "작업 끝까지 진행" )

#echo ${BASICEST} && ${GITCLONE} && echo "AWS프리티어 기준 약 2시간, 사양좋으면 30분 내외." && {BOOSTSET}

echo ${BASICSET} && echo "-------------------aws ubuntu buildset---------------"  && echo ${GITCLONE} && echo "CLONE OK "&& echo ${BOOSTSET} && echo ${BERKLYDB} && echo "${PWD}경로로 make install " && echo ${MAKEINSTALL} 


