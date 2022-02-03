#include <iostream>
using namespace std;

int main(void)
{
	try
	{
		throw 128;	
	}
	catch(int errCode){
		cout << "An exception occured. Exception Error code : " << errCode << endl;
	}

	return 0;
}
