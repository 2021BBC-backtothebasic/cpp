#include <iostream>
#include <exception>
using namespace std;

void ExceptHandler()
{
	cout << "Exception111 " << endl;

	exit(-1);
};

struct MyException : public exception //비권장
{
	const char* what() const throw()
	{
		return "Defining new exception";
	}
};

int main(void)
{
	try
	{
		throw MyException();
	}
	catch (MyException& e)
	{
		cout << "MyException Caught" << endl;
		cout << e.what() << endl;
	}
	catch (const std::exception& e)
	{
		//other err
		
	}
	
	return 0;
}
