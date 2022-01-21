//StrLiteralExam
#include <iostream>
using namespace std;

void IncreamentAll(int *start, int *stop)
{
	int* current  = start;
	while(current != start)
	{
			++(*current); // increament value pointed(data)
			++current;	// increament vapointer(address)
	}	
}

	void PrintAll(const int* start, const int * stop)
	{
			const int* current = start;
			while(current != stop)
			{
				cout << *current << endl;
				++current; //increament pointer(addresss)
			}
	}
int main()
{
	int nNmbers[] = {10, 20, 30 };
}