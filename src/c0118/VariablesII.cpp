#include <iostream>
using namespace std;

int main()
{
    int nNum = 6;
    float fNum = 6.12345678;
    double dNum = 8.1234567890123456;
    char cLetter = 'A';
    bool isVar = true;
    string strText = "Hellow\v str\a"; // \이스케이프문자
    int isNumber = true;
    // \n 엔터 (리눅스는 \r\n)
    // \t 탭
    // \r 캐리지리턴
    // \v 버티컬: 위아래로 갈라짐
    // \a (옛)pc용스피커에서 삐빅 소리
    
    cout << strText << endl;
    cout << "int : " << nNum << endl;
    cout.precision(7); // 7자리까지
    cout << "float(prec7) : " << fNum << endl;
    cout << "float(fixed) : " << fixed << fNum << endl;//고정한다
    
    cout.precision(15); // 15자리까지 
    cout << "double(prec15) : " << dNum << endl;
    cout << "double(fixed) : " << fixed << dNum << endl; //고정한다
    
    cout << "char : " << cLetter << endl;
    cout << "bool : " << isVar << endl;
    cout << “bool isVar : “ << isVar << “, bool is False : “ << isFalse << ", isNumber : " << isNumber << endl;
    
    
    cout << "string : " << strText << endl;
    //cout은 type을 자동체크해주기 때문에 cLetter에 숫자넣으면 안됨
    printf("cLeter number : %x\r\n", cLetter); // 16진수 d는 65, x 는 41
    printf("float : %f\n" , fNum);
    cout << "==================" << endl;

    
    
    char chA = ‘A’;
    char chAA = 65 , chBB = 66, chCC = 67;
    

    cout << “chA : “ << chA << endl;

    char chAAa = 0x41 , chBBb = 0x42, chCCc = 0x43;
    //numlock걸고 224 이런식으로도 표현가능 
    cout << chAAa << chBBb << chCCc << endl;
    
    return 0;   
}