#include <iostream>

using namespace std;

struct ExamSize
{
    char a;     // a byte
    int b;      // 4 byte;
    double c;   // 13byte;
};

int main(int argc, char* argv[])
{
    
    cout << " structure ExamSize's Member variable size : " << endl;
    cout << "char : " << sizeof(char) << ", " << sizeof(int) << ", " << sizeof(double) << endl;
    
    cout << "Size of structure : " << sizeof(ExamSize) << endl;
    
    return 0;
}