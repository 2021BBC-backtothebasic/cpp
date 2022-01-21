#include <iostream>
#include <string>

using namespace std;
void abc(int &x)
{
    x = 100; 
    cout << x << endl;
}

int main()
{
    string food = "Pizza";
    string & meal = food;
    //meal이라는 주소에 food값을 넣었다.
    
    
    //meal의 내용을 바꿔보자
    meal = "Hamburger";
    
    
    cout << food << " Address of food : " << &food << endl;    
    cout << "Address of meal : " << &meal << endl;

    int xx = 200;
    abc(xx);
    cout << "xx : " << xx << endl;
    //메모리가 참조되기때문에 int xx 200을 줬어도 100을 참조한다.
    
    
    return 0;
    
 }