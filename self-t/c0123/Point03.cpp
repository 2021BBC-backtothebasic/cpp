/*
 * 배열 & 포인터 & 함수
 * 함수의 파라미터 혹은 리턴값으로 포인터를 이용하는 이유
 * 1: 연속된 메모리 공간에 주소값으로 처리
 * 2: CallbyReference:  함수에서 하나 이상의 값을 리턴하거나 변경해야 하는 경우
 * 3: 동적할당
 * 4: 메모리 공간의 효율적 사용: 거대한 사용자 자료형을 함수 파라미터로 주소값만 넘기면 되므로 (메모리에 복사를 줄임)
 * => 데이터 크기가 얼마이든 포인터에 해당하는 4바이트(8바이트) 아키텍쳐에 해당하는 기본 데이터로 통신가능
 */

#include <iostream>
using namespace std;

void PrintData(int*);

int main()
{
	cout << "배열 & 포인터 & 함수 " << endl;

	int arrNum[5] = { 0, 1, 2, 3, 4 };

	for(int i = 0; i< 5; i++)
	{
		cout << " arrNum[" << i << "]: " << arrNum[i] << " &arrNum[" << i << "]: " << &arrNum[i];
		cout << endl;
	}

		PrintData(arrNum); //PrintData(&arrNum[0]);
}

void PrintData(int* pArrNum) //int* pArrNum = arrNum;
{
	for(int i = 0; i < 5; i++)
	{
		cout << " *(pArrNum + " << i << "): " << *(pArrNum + i) << " (pArrNum + " << i << "): " << (pArrNum + i) << endl;
	}

	for(int i = 0; i < 5; i++)
	{
		cout << " (pArrNum + " << i << "): " << pArrNum[i] << endl;
	}

}

