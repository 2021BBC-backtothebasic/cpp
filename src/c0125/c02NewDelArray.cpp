#include <iostream>

using namespace std;

int main()
{
	int n; // int i, n;
	int* ptrNumber = new(nothrow) int[n]; //메모리 할다이 실패할 때 bad_alloc exception 주거나 nullptr을 반환한다.
	// ptrNumber = new []

	cout << "How many numbers input ? " << endl; cin >> n;
	ptrNumber = new int[n];
	if(ptrNumber == NULL) //null or nullptr
	{
		cout << "Error memory could not be allocated\n";
		exit(1);
	}	
	else
	{
		for(int i = 0; i < n; i++)
		{
			cout << "Enter a number : "; cin >> ptrNumber[i];
		}

		cout << "You have entered : ";
		for(int i = 0; i < n; i++)
		{
			cout << ptrNumber[i] << ", ";
		}

		delete[] ptrNumber;
	}

	return 0;	
}
