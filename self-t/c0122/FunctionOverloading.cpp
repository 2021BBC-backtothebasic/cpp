#include <iostream>
using namespace std;

void Func(void)
{
	cout << "Func(void) called" << endl;

}

void Func(char c)
{
	cout << "Func(char c) called" << endl;	
}

void Func(int a, int b)
{
	cout << "Func(int a, int b) called" << endl;
}

int main(void)
{
	Func();
	Func('C');
	Func(12,13);

	return 0;
}
