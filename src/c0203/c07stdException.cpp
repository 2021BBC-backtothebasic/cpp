#include <iostream>
#include <exception>

using namespace std;

//struct
//class 

void ExceptHandler()
{
	cout << "Exception !!!! " << endl;

	exit(-1); //프로그램 강제종료
}
int main(void)
{
	set_terminate(ExceptHandler); //터미네이터에 내 핸들러 함수로 정해줌
	try
	{
		throw 1;
	}
	catch (char* const ex)
	{
		//cannot process integer exception
	}
	return 0;
}
