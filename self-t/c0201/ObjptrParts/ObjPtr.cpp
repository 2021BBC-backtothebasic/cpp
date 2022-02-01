#include <iostream>
#include "ObjPtr.h"

class Person
{
    public: void Person::Sleep() { cout << "Sleep" << endl;}
}

class Student : public Person
{
public: void Student::Study() { cout << "Study" << endl;}
}

class PartTimeStudent : public Student
{
public: void PartTimeStudent::Work()  { cout << "Work" << endl;}
}
