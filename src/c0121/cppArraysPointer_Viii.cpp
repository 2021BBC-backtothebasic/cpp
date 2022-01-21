#include <iostream>
#include <string>
using namespace std;

int main()
{
	string food = "Hamburger";
	string* ptrFood = &food;

	cout << "food : " << food << "Address of food  : " << &food <<endl;
	cout << "ptrfFood : " << *ptrFood << "Address of food  : " << ptrFood <<endl;

	int nNumber = 1234;
	int* ptrNumber = &nNumber;
// 포인터 prtrNumber가 가리키는 주소를 &nNumber주소를 참조해서 초기화했다.

	cout << "nNumber  : " << food << "Address of nNumber  : " << &nNumber  <<endl;
	cout << "ptrNumber : " << *ptrFood << "Address of nNumber  : " << ptrnNumber   <<endl;


	return 0;
}