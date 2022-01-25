#include <iostream>

using namespace std;

int main()
{
	int n; // int i, n;
	int* ptrNumber;
	
	cout << "How many numbers input ? " << endl; cin >> n;
	ptrNumber = new int[n];
	if(ptrNumber == nullptr) //null or nullptr
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
