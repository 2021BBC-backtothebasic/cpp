#include <iostream>
using namespace std;

double division(int a, int b)
{
	if(b==0)
	{
		throw "Division by Zero!!";
	}
	return (double)(a/b);
};
int main(void)
{
	int x = 50;
	int y = 0;
	double z = 0.0f;

	try
	{
		z = x/y;
		
	}
	catch(const std::exception& e)
	{	
	cerr << e.what() << endl;
	}

	return 0;
}
