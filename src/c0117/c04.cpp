#include <iostream>

using namespace std;

int main(int argc, char* argv[]) // 옵션
{
    int num; //초기화를 안해서 바로 실행하면, warining이 날 수 있음
    num = 15; // .'.초기값 할당
    cout << num << "\n";
    
    if(argc > 1)
    {
        //출력의 방향 : cout은 항상 왼쪽
        cout << "argc = " << argc << endl;
        for(int i = 0; i < argc; i++)
        {
            cout << "argc[" << i << "]" << " = " << argv[i] << endl;
        }
    }
    
    // double : 실수(realNum)선언
    double fNum = 99.999;
    char cLetter = 'A';
    string strText = "Hellow C++ !!!";
    
    cout << "fNum = " << fNum << ", cLetter = " << cLetter << ", string " << strText << endl;
    printf("floatNum[%f], charLetter[%C] \n ", fNum, cLetter); //string은 지원안됨
    
    
    
    //Multiple Variable 선언
    int x = 15, y = 21, z = 60;
    cout << "x" << x << "y" << y << "z" << z << endl;
    cout << "sum = " << x + y + z << endl;
    
    
    
    // Local Variable
    int a, b;
    return 0;
}