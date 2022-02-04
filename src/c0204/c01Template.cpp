#include <iostream>
using namespace std;

template <typename T> // typename key word in 98 version
void Swap(T& a, T& b);


template <> void Swap<double>(double&, double&); //prototype
int main()
{
    int c = 12, d =15;
    cout << "c : " << c << ", d : " << d << endl;
    Swap(c, d);
    cout << "after swap => " << "c : " << c << "d : " << d << endl;
    
    double x = 12.45, y = 72.12;
    cout << "x : " << x << ", y : " << y << endl;
    Swap(x, y);
    cout << "after swap => " << "x : " << x << "y : " << y << endl;
    
    string strA = "Hello", strB = "world";
    cout << "strA : " << strA << ", strB : " << strB << endl;
    Swap(strA, strB);
    cout << "after swap => " << "strA : " << strA << "strB : " << strB << endl;
    
    return 0;
}

template <typename T> //typename key word in 98 version
void Swap(T& a, T& b)
{
    T temp;
    temp = a;
    a = b;
    b = temp;
    
}

template <> void Swap<double>(double&, double&) //implements
{
 // Do not swapping double number
    double temp = a;
    temp = a;
    a = b;
    b = temp;
}
