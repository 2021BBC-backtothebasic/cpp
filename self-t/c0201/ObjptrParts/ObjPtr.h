#ifndef _OBJPTR_H_
#define _OBJPTR_H_

using namespace std;

class Person
{
public:
    void Sleep();
};
class Student : public Person
{
    public: void Study();
};

class PartTimeStudent : public Student
{
public: void Work();
};


#endif