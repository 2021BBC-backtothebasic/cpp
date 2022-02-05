#include <iostream>
using namespace std;

class Base
{
public:
    Base() { cout <<"Base Constructor" << endl;
    }
    void SimpleFunc() { cout << "BaseOne" << endl;}
};

class MiddleDrivedOne: virtual public Base{
public:
    MiddleDrivedOne() : Base(){
        cout << "MiddleDrivedOneConstructor" << endl;
    }
    void MiddleFuncOne(){
        SimpleFunc();
        cout <<"MiddleDrivedOne"<<endl;
    }        
};

class MiddleDrivedTwo : virtual public Base{
public:
    MiddleDrivedTwo(): Base(){
        cout << "MiddleDrivedTwoConstructor" << endl;
    }
    void MiddleFuncTwo(){
        SimpleFunc();
        cout << "MiddleDrivedTwo" <<endl;
    }
};

class LastDerived : public MiddleDrivedOne, public MiddleDrivedTwo{
public:
    LastDerived(): MiddleDrivedOne(), MiddleDrivedTwo(){
        cout << "LastDerived Constructor" << endl;
    }
    void ComplexFunc()
    {
        MiddleFuncOne();
        MiddleFuncTwo();
        SimpleFunc();
    }
};

int main(void)
{
    cout <<"Press the Buttons to accumulate self.." << endl;
        LastDerived ldr;
    cout << "Gather YourSelf..." << endl;
    ldr.ComplexFunc();
    
    return 0;
}