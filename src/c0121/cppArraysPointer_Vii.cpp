#include <iostream>
#include <string> /* add */
using namespace std;

int main()
{
	string food = "Hamburger";
	string *ptrFood = &food;

	cout << "food : " << food << "Address of food  : " << &food <<endl;
	cout << "ptrfFood : " << *ptrFood << "Address of food  : " << ptrFood <<endl;
	// * 은 방이다.

	return 0;
}