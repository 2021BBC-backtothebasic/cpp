#include <iostream>

using namespace std;

#pragma pack (push, 1)
struct ExamSize1
{
    char a;     // a byte
    int b;      // 4 byte;
    double c;   // 13byte;
};

#pragma pack(pop) // 메모리차이 참고
struct ExamSize2
{
    char a;     // a byte
    int b;      // 4 byte;
    double c;   // 13byte;
};
//#pragma pack(pop) 위와 동일

int main(int argc, char* argv[])
{
    
    cout << " structure ExamSize's Member variable size : " << endl;
    cout << "char : " << sizeof(char) << ", " << sizeof(int) << ", " << sizeof(double) << endl;
    
    cout << "Size of structure : " << sizeof(ExamSize) << endl;
    
    return 0;
}