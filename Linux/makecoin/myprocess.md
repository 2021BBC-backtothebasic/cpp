#### 1. 프로젝트 폴더설정 ###
mkdir makeCoin
cd makeCoin

### 2. 원본소스관리 ###
lone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin ./litecoin-0.15
#출처 : https://github.com/litecoin-project/litecoin/tree/0.15/doc

#원본소스
mv -fv ./litecoin-0.15 ./litecoin-0.15.org
#작업소스
cp -mfv ./litecoin-0.15.org/ ./litecoin



### 3. 작업전 패키지 세팅###
##window-ref : build-windows.md
sudo apt install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git
sudo apt install g++-mingw-w64-x86-64
sudo update-alternatives --config x86_64-w64-mingw32-g++ # Set the default mingw32 g++ compiler option to posix.
#.posix 1번선택
PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g') # strip out problematic Windows %PATH% imported var
# BUILD
cd depends
make HOST=x86_64-w64-mingw32

##mac-ref : build-osx.md
brew install automake berkeley-db4 libtool boost --c++11 miniupnpc openssl pkg-config protobuf qt libevent
brew install mingw-w64 
#BerkeleyDB
./contlib/install_db4.sh .

#MAKE BUILD
cd depends
make HOST=arm-apple-darwin21.2.0

#ps. llvm-gcc 확인
#ps. https://bitcoin.stackexchange.com/questions/90843/configure-error-no-working-boost-sleep-implementation-found
#ps. /Library/Develper/CommandLineTools/

# mac m1
./configure --prefix=$PWD/depends/arm-apple-darwin20.2.0


##build-unix.md



#---------------------------------------------------#
