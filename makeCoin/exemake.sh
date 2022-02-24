
echo "프로젝트명 영문 입력"
read pjname
echo "4글자 이니셜 입력 (예시: IPFC )"
read initialname

echo -e "\n>>exe build를 준비합니다. (3~5분)"
buildSetchk=$(
sudo apt-get -y update --allow-unauthenticated; sudo apt-get -y upgrade --allow-unauthenticated;  
sudo apt-get -y install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git; sudo apt-get install g++-mingw-w64-x86-64 -y; sudo apt-get -y install nsis ; echo "1" | sudo update-alternatives --config x86_64-w64-mingw32-g++;  # Set the default mingw32 g++ compiler option to posix.; sudo apt-get install -y libprotobuf-dev

; PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g'); # strip out problematic Windows %PATH% imported var;
sudo bash -c "echo 0 > /proc/sys/fs/binfmt_misc/status"; # Disable WSL support for Win32 applications.;
 sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools ; sudo apt-get install qtwayland5 -y; sudo apt-get install libqrencode-dev -y)
echo ${buildSetchk}


pjsource=$( git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin.git ./${pjname}coin)
echo ${pjsource}

echo -e "\n>> depends make를 시작합니다 10~20분\n"

depmake=$(cd ${pjname}coin; cd depends; make clean; make -j 8 HOST=w86_64-w64-mingw32;)
echo ${depmake}


echo -e "\n>> 프로젝트 메인 make컴파일을 시작합니다. 약 1시간 내외 "

coinmake=$( cd ${pjname}coin; make clean; ./autogen.sh ; CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/ ; make -j 8; make install DESTDIR=$PWD/execute_${pjname})
echo ${coinmake}


echo -e "\n>> ${pjname}coin 폴더의 상태를 확인하세요."
