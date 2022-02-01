#include <iostream>
#include "ObjPtr.h"

class Person
{
    public: void Sleep() { cout << "Sleep" << endl;}
}

class Student : public Person
{
public: void Study() { cout << "Study" << endl;}
}

class PartTimeStudent : public Student
{
public: void Work()  { cout << "Work" << endl;}
}
