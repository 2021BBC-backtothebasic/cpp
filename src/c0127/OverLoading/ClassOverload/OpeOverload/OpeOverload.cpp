//OpeOverload.cpp

#include <iostream>
#include "Box.h"

using namespace std;

int main() {
	CBox box1;
	CBox box2;
	CBox box3;
	double volume = 0.0f;

	box1.SetLength(6.5);
	box1.SetBreath(7.0);
	box1.SetHeight(5.0);

	box2.SetLength(12.5);
	box2.SetBreath(13.0);
	box2.SetHeight(12.8);

	volume = box1.GetVolume();
	cout << "Volume of box1 : " << volume << endl;

	volume = box2.GetVolume();
	cout << "Volume of box2 : " << volume << endl;

	box3 = box1 + box2;
	//box1 : 
	//box2 : box2의 내용을 바꿀 수 없음
	//box3 : Operator를 재정의해서 사용하기위한 variable
	//참고: 변수는 주소 역할일뿐

	volume = box3.GetVolume();

	cout << "Volume of box3 : " << volume /* (box1 + box2).GetVolume() */ << endl;

	return 0;
}

