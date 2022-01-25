#include <iostream>
using namespace std;

int main()

{

		int row = 3, col = 5;

		int* row_1 = new int[col] {1,2,3,4,5]}; // int 원소 5개의 1차원 동적 배열 row_1

		int* row_2 = new int[col] {6,7,8,9,10};  // int 원소 5개의 1차원 동적 배열 row_2

		int* row_3 = new int[col] {11,12,13,14,15}; //int원소 5개의 1차원 동적 배열 row_3



		int** towd_array  = new int* [row]{row_1, row_2, row_3};
		//int* 포인터 원소 3개( = 1차원 배열 이름 3개)의 2차원 동적배열 2d_array
						
						//포인터 3개가 들어있는 배열(포인터)의 주소를 리턴받음
						
						//포인터의 포인터이므로 2d_array의 타입은 int **가 된다.
						
						
						
		delete[] row_1;
		delete[] row_2;
		delete[] row_3;
		delete[] towd_array;
				
										}
