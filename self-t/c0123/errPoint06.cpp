/* 포인터 & 이차원배열
 * 문법: 자료형(*포인터 변수명) [ROW] ex; int (*ptrArr)[3]
 */

#include <iostream>

using namespace std;

const int COL = 8;
const int ROW = 9;

void Init(int (*ptrArr)[ROW]);
void PrintData(int (*ptrArr)[ROW]);
void SelectData(int ptrArr[][ROW]);

int main()
{
	cout << "이중 포인터 & 배열" <<endl;
	
	int arrResult[COL][ROW]; //72개의 구구단 결과 저장

	cout << "arrResult[COL][ROW]: " << sizeof(arrResult) << endl;

	//1. 배열에 구구단 결과를 저장
	Init(arrResult);

	//2. 저장된 데이터를 기반으로 화면 출력
	PrintData(arrResult);

	//3. 원하는 구구단 결과만 따로 출력
	SelectData(arrResult);
}

void Init(int(*ptrArr)[ROW])
{
	for(int i=0; i< COL; i++)
	{
		for(int j = 0; j<ROW; j++)
		{
			ptrArr[i][j] = (i + 2) * (j + 1);
			//*(*(ptrArr + i ) + j ) = (i + 2 ) * ( j+ 1);
		}
	}
	cout << "sizeof(ptrArr): " << sizeof(ptrArr) << endl;
}

void PrintData(int(*ptrArr)[ROW])
{
	for(int i =0; i< ROW; i++)
	{
		for(int j= 0; j< COL; j++)
		{
			cout << " " << (j + 2) << " X " << (i + 1) << " = " << ptrArr[j][i];
			//cout << " " << (j +2 ) << " X " << (i + 1) << "= " << *(*(ptrArr + j) + i);
			//cout << " " << (j + 2) << " X " << (i + 1) << "= " << (*(ptrArr+ j))[i];
			//cout << " " << (j + 2) << " X " << (i + 1) << "= " << *(ptrArr[j] + i);
		}
		cout << endl;
	}

	cout << "sizeof(ptrArr): " << sizeof(ptrArr) << endl;

	//1행의 열이 출력(이중포인터가 아닌 값 참조)..
	for(int j =0; j< COL; j++)
	{
	 	cout << "**ptrArr++: " << **(ptrArr++) << endl; // ++는 ROW만큼 이동..
	}

}

void SelectData(int ptrArr[][ROW])
{
	 int selectCol = 0;
	 cout << endl << "몇 단을 보여드릴까요? ";
	 cin >> selectCol;

	selectCol -= 2;

	 for(int i = 0; i< ROW; i++)
	 {
		cout << " " << (selectCol + 2) << " X " << (i + 1) << "= " << ptrArr[selectCol][i] << endl;
		//cout << " " << (selectCol + 2) << " X " << (i + 1) << "= " << *(*(ptrArr + selectCol) + i ) << endl;
	 }

	 cout << "sizeof(ptrArr): " << sizeof(ptrArr) << endl;
}
