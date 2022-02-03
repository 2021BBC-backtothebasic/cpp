#include <iostream>
#include <fstream>
#include <sstream> // string stream 

using namespace std;

int main(void)
{
	char data[100];

	ofstream outputFile;
	outputFile.open("simplefile.data");

	cout << "Writing to the File" << endl;
	cout << "Enter Your Name : "; 
	cin.getline(data, 100); //100byte로 data를 입력  받는다
	outputFile << data << endl;

	cout << "Enter your age : " << endl;
	cin >> data;
	cin.ignore(); //

	outputFile << data << endl;
	outputFile.close();

	ifstream inputFile;
	inputFile.open("simplefile.dat");

	cout << "-----------Reading from the simplefile.dat-----------" << endl;
//	stringstream strStream
	inputFile >> data;
	cout << data << endl;


//	strStream << inputFile.rdbuf(); //
//	cout << strStream.str(); //


	inputFile.close();

	return 0;
}
