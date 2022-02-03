#include <iostream>
#include <fstream>

using namespace std;

int main(void)
{
	//미리 파일크기 확인 후 한 번에 읽어서 복사하기
	ifstream in;
	in.open("workplace.jpg", ios::in | ios::binary);

	in.seekg(0, ios::end); //end position까지 seek

	long fileLength = in.tellg();//파일길이

	cout << "Read file size: "<< fileLength << "Byte " << endl;

	//loading total file size in memory
	in.seekg(0, ios::beg);
	char* buf = new char[fileLength];//작은파일이라서 한번에
	in.read(buf, fileLength);
	in.close();

	//buffer to file
	ofstream oFile;
	oFile.open("workplace_copy.jpg", ios::in | ios::binary); //create File한것이다.
	oFile.write(buf, fileLength);
	oFile.close();

	return 0;
}


