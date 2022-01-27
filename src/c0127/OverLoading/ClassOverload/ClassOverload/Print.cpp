#include "Print.h"

//구현체
void CPrint::print(int i) {
	cout << "Integer number : " << i << endl;
}

void CPrint::print(double f) {
	cout << "double number print : " << f << endl;
}

void CPrint::print(char* str) {
	cout << "Char* string print : " << str << endl;
}
//Print()라는 함수를 여러 유형으로 사용한다는 
//폴리모피즘 즉, 다형성 = Print()라는 함수를 여러 유형으로 사용할수있게 세팅함