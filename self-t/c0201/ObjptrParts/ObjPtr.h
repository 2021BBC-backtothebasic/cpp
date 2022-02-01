#ifndef __OBJPTR_H_
#define __OBJPTR_H_

using namespace std;

class Person
{
public:
    void Sleep();
};
class Student : public Person
{
    void Study();
};

class PartTimeStudent : public Student
{
public: void Work();
};


#endif