#include <iostream>

int main()
{
	char* pChar = new char;
	*pChar = 'a';
	cout << "Memory address : " << (void*)pChar << "\t value: " << *pChar << endl;
	cout << "Heap size : " << sizeof(*pChar) << endl;
	if(pChar != NULL){
		delete pChar;
		pChar = NULL;
	}

	int* ptrNum = new int;
	*ptrNum = 24;
	cout << "Memory address : " << (void*)ptrNum << "\t value : " << *ptrNum << endl;
	cout << "Heap size : " << sizeof(*ptrNum)<< endl;
	if(ptrNum != NULL)
	{
		delete ptrNum;
		ptrNum = NULL;
	}

	double* ptrDNum = new double;
	*ptrDNum = 3.141592;
	cout << "Memory address : " << (void*)ptrFNum << "\t value : " << *ptrDNum << endl;
	cout << "ptrDNum Heap size : " << sizeof(*ptrDNum) << endl;
	if( ptrDNum != NULL)
	{
		delete ptrDNum;
		ptrDNum = NULL;
	}
	
	
	float* ptrFNum = new float;
	*ptrFNum = 3.14;
	cout << "Memory address : " << (void*)ptrFNum << "\t value : " << *ptrFNum << endl;
	cout << "ptrFNum Heap size : " << sizeof(*ptrFNum) << endl;
	if(ptrFNum != NULL)
	{
		delete ptrFNum;
		ptrFNum = NULL;
	}

	
	return 0;
}
