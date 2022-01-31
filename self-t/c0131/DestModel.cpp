#include <iostream>
#include <cstring>

using namespace std;

class Person
{
private:
    char* name;
public:
    Person(char* myname)
    {
        name = new char[strlen(myname)+1];
        strcpy(name, myname);
    }
    ~Person()
    {
        delete []name;
    }
    void WhatYourname() const
    {
        cout <<"My name is " << name << endl;
    }
};

class UnivStudent : public Person
{
private:
    char* major;
public:
    UnivStudent(char* myname, char* mymajor)
        :Person(myname)
    {
         major = new char[strlen(mymajor)+1];
         strcpy(major, mymajor);
    }
    ~UnivStudent()
    {
        delete []major;
    }
    void WhoAreYou() const
    {
        WhatYourname();
        cout << "My major is " << major << endl << endl;
    }
};

int main(void)
{
    UnivStudent st1("Kim", "Matchmatics");
    st1.WhoAreYou();
    
    UnivStudent st2("Hong", "Physics");
    st2.WhoAreYou();
    
    return 0;
}