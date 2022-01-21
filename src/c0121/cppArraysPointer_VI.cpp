#include <iostream>
using namespace std;

int main()
{
	int grade[3] = { 85, 65, 90 };
	int &refGrade = grade[0]; /* add */ // greade[0] 주소를 참조함

	for(int i = 0; i< 3; i++)
    { // 출력
		cout << refGrade + i << endl;
	}
}