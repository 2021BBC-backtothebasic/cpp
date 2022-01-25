#include <iostream>
#include <memory> /* add */
using namespace std;

/* 스마트 포인터
1. unique_ptr
    - 하나의 스마트 포인터만이 특정 객체를 소유할 수 있도록, 객체에 소유권 개념을 도입한 스마트 포인터 입니다.
2. shared_ptr //**가장 많이 쓰임
    - 하나의 특정 객체를 참조하는 스마트 포인터가 총 몇개인지를 참조하는 스마트 포인터 입니다.
    //스마트포인터를 new delete를 자동으로 해줌
    
3. weak_ptr
    - 걍 이런게 있다. 하나이상의 shared_ptr인스턴스가 소유하는 객체에 대한 접근을 제공하지만, 소유자의 수에는 포함되지 않는 스마트포인터입니다.
*/

class CPerson {
    private:
        string strName;
        int nAge;
    public:
        CPerson(const string& name, int age);
        ~CPerson() { cout << "Object Destructor" << endl; }
        void ShowPersionInfo();    
}

int main()
{  
    // unique_ptr<CPerson> ptrPerson = make_unique <CPerson>("James Hetfield", 59); //new 대신해서 make_unique
    shared_ptr<CPerson> ptrPerson = make_shared <CPerson>("James Hetfield", 59); //new 대신해서 make_shared 
    cout << "Currently Own count : " << ptrPerson.use_count() << endl;
    auto james = ptrPerson;
    ptrPerson->ShowPersionInfo(); //메모리에 할당
    
    cout << "Currently Own count : " << ptrPerson.use_count() << endl;
    ptrPerson->ShowPersionInfo(); //메모리에 할당
    return 0;
}

CPerson::CPerson(const string& name, int age)
{
 strName = name;
    nAge = age;
    cout << "Object constructor!!!" << endl;
}

void CPerson::ShowPersionInfo()
{
    cout << strName << "'s Age : " << nAge << endl;
}