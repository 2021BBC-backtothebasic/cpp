#include <iostream>
using namespace std;

int main()
{
	cout << "포인터 기초" << endl;
	
	int num = 100;
	int* pNum = &num;

	cout << "num: " << num << " &num: " << &num << endl;
	cout << "pNum: " << pNum << " *Num: " << *pNum << " &pNum: " << &pNum << endl;

}

/* Result
 * 포인터 기초
 * : 주소를 저장하는 변수 
 * 
 */
