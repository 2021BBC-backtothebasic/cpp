#include <iostream>
using namespace std;

int Addr(int num1=1, int num2=2)
{
	return num1+num2;
}

int main(void)
{
	cout << Addr() << endl;
	cout << Addr(5) << endl;
	cout << Addr(3,5) << endl;

	return 0;
}
