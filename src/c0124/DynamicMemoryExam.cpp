#include <iostream>
//#include <stdio.h>
#include<stdlib.h>
using namespace std;

int main()
{
	int i;
	int arrLen = 3;
	int* ptrArr;

	//ptrArr = (int*)malloc(arrLen * sizeof(int)); // dynamic allocation memory
	ptrArr = (int*)calloc(arrLen, sizeof(int));

	if(ptrArr == NULL)	//dynamic allocation fail 메모리가 없는 경우
	{
		cout << "Dynamic memory allocation fail.." << endl;
		exit(1); //프로그램을 빠져나가는 명령어 -- OS가 받아준다.
		//보통 error가 이을때 양의정수를 준다.
		// 정상적인 종료 interrupt를 받았을때
	}

	cout << "Dynamic allocation memory initial value : \n";
	for(int i = 0; i< arrLen; i++)
	{
		cout << ptrArr[i] << endl;
	}
	free(ptrArr); // 메모리 release

	cout << "Hello";


	return 0; //
}
