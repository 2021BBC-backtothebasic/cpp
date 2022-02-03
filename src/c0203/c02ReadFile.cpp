#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(void)
{
	string readString;
	ifstream readFile("simplefile.txt");

	while(getline(readFile, readString)) //line단위로 읽어온다.
	{
		cout << readString;
	}

	return 0;
}
