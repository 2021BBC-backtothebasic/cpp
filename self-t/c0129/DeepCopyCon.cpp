#include <iostream>
#include <cstring>
using namespace std;

class Person
{
    char* name;
    int age;
public:
    Person(char* myname, int myage)
    {
        int len = strlen(myname) + 1;
        name = new char[len];
        strcpy(name, myname);
        age = myage;
    }
    Person(const Person& copy)
        : age(copy.age)
        {
            name=new char[strlen(copy.name)+ 1];
            strcpy(name, copy.name);
        }
    void ShowPersonInfo() const
    {
        cout << "이름 : " << endl;
        cout << "나이 : " << age << endl;
    }
    ~Person()
    {
        delete []name;
        cout << "called destructor" << endl;
    }
};

int main(void)
{
    Person girl1("zwi", 24);
    Person girl2 = girl1;
    girl1.ShowPersonInfo();
    girl2.ShowPersonInfo();
    
    return 0;
}