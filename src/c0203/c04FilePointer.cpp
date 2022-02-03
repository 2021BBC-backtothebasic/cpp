#include <iostream>
#include <fstream>

using namespace std;

const char* fileName = "simplefile.txt";

int main(void)
{
	long lFirst, lEnd;

	ifstream iFile; //inputFile
	iFile.open(fileName, ios::in | ios::binary); //Read input or binary
	
	lFirst = iFile.tellg();//tellg: 읽어올 곳의 포인터위치 찾기
	iFile.seekg(0, ios::end);//seek get
	lEnd = iFile.tellg(); // pointer position search
	iFile.close();

	cout << "file [ " << fileName << " ] size : " << (lEnd -lFirst) << endl; 

	return 0;
}
