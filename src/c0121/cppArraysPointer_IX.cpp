#include <iostream>

using namespace std;

int main()
{
    int arrNumber[5];
    int* ptr;
    ptr = arrNumber;  *ptr = 10; //arrNumber[0]에 넣는것과 같은효과
    //ptr  == array arrNumber
    ptr++; *ptr = 20; //arrNumber[1]에 넣음
    ptr = &arrNumber[2]; *ptr = 30; //arrNumber[2];
    ptr = arrNumber + 3; *ptr = 40; //arrNumber[4];
    
    ptr = arrNumber; *(ptr + 4) = 50;
    
    for(int i=0; i<5; i++)
    {
        cout << "[" << i << "] = " << arrNumber[i] << endl;    
    }
        
        cout << "Hello World! \n";
    
    return 0;
}