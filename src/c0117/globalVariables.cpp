#include <iostream>
using namespace std;

//Global variable declaration;
int g = 100;

int main()
{
    //local Variable Declation;
    int a, b;
    
    //actual initializtion
    a = 10;
    b = 20;
    g = a + b;
    
    cout << g;
    return 0;
}
