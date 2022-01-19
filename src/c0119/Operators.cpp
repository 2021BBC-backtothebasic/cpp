#include <iostream>
using namespace std;

int main()
{
    int x = 100 + 200;
    int y = x + 400;
    //int z = y / x;//정수연산을 했기때문에 소수점 버림
    float z = (float)y / (float)x; //type casting을 한다.
    
    // % 나머지 연산자
    int xx = y % x;
    
    // std::cout << "x = "<< x << std::endl;
    
    cout << "x = " << x << endl;
    cout << "y = " << y << endl;
    cout << "z = " << z << endl;
    cout << "xx = " << xx << endl;
    
    
    //대입연산자 assignment operator
    int nNumber = 10;
    // nNumber %= 25;
    nNumber -= 5;
    
    
    cout << "nNumber : " << nNumber << endl;
    
    int isX = 10, isY = 7;

    //Comparison Operators
cout << "Return Value : " << (isX > isY) << endl;
cout << "Return Value : " << (isX == isY) << endl;
cout << "Return Value : " << (isX != isY) << endl;
cout << "Return Value : " << (isX >= isY) << endl;
cout << "Return Value : " << (isX <= isY) << endl;
    
    //Bitwise Operator
    //60 : 0011 1100, 13: 0000 1101
    unsigned char A = 60, B = 13;
    cout << "(A & B) : " << (unsigned)(A & B) << endl;
    cout << "(A | B) : " << (A | B) << endl;
    cout << "(A ^ B) : " << (A ^ B) << endl;
    cout << "~A : " << ~A << endl;
    cout << " "<< bitset<8>(~A) << endl;
        
    return 0;
}