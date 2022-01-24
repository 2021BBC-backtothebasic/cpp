#include <iostream>

using namespace std;

int main()
{
	int* ptrInt = new int;
	*ptrInt = 1024;

	double* ptrDouble = new double;
	*ptrDouble = 3.14152;
	
	cout << "int type ptr value : " << *ptrInt << endl;
	cout << "double type ptr value : " << *ptrDouble << endl;


	//defend codne
	if(ptrInt != NULL)
	{
		delete ptrInt;
		ptrInt = NULL;
	}
	if(ptrDouble != NULL)
	{
		delete ptrDouble;
		ptrDouble = NULL;
	}

	return 0;
}
