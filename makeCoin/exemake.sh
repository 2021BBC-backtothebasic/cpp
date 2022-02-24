
echo "프로젝트명 영문 입력"
read pjname
echo "4글자 이니셜 입력 (예시: litecoin = LITC )"
read initialname

echo "exe build를 준비합니다. (3분이내)"
buildSetchk=$(
sudo apt-get install g++-mingw-w64-i686 mingw-w64-i686-dev -y;
echo "1" | sudo update-alternatives --config i686-w64-mingw32-g++;  # Set the default mingw32 g++ compiler option to posix.
PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g'); # strip out problematic Windows %PATH% imported var
sudo bash -c "echo 0 > /proc/sys/fs/binfmt_misc/status"; # Disable WSL support for Win32 applications.
)
echo ${buildSetchk}


pjsource=$( git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin.git ./${pjname}coin)
echo ${pjsource}

depmake=$(cd ${pjname}coin; cd depends; make -j 8 HOST=w86_64-mingw32;)
echo ${depmake}


echo "본격적으로 make컴파일을 시작합니다. 약 1시간 내외 "

coinmake=$( cd ${pjname}coin; ./autogen.sh ; CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/ ; make -j 8; make install DESTDIR=$PWD/${pjname}coin_bin)
echo ${coinmake}
