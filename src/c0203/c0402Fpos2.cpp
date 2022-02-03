#include <iostream>
#include <fstream>
#include <cstring>

using namespace std;

struct DATE
{
	int year;
	int month;
	int day;
};
int main(void)
{
	DATE arrDate[3] = {
		{ 2021, 12, 25},
		{ 2022, 11, 11},
		{ 2022, 2, 3 }
	};

	DATE date;
	DATE wDate;

	ofstream outFile;
	outFile.open("test.txt", ios::out | ios::binary); //text binary
	outFile.write((char*)arrDate, sizeof(DATE) * 3);

	outFile.seekp(0); 
	outFile.write((char*)&wDate, sizeof(DATE));
	outFile.close();

	//읽어보자 feat.다른방법으로 //<cstring>
	ifstream inputFile;
	memset(arrDate, 0, sizeof(DATE) * 3);//memset: initiate // arrDate를 0로 채워놓고 크기(sizeof(DATE)*3)로 
	inputFile.open("test.txt", ios::in | ios::binary);
	inputFile.read((char*)&arrDate, sizeof(DATE) * 3);

	for(int i=0; i<3; i++)
	{
		cout << arrDate[i].year << "-" << arrDate[i].month << "-" << arrDate[i].day << endl;
	}

	return 0;
}
