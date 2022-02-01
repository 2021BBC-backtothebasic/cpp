#include "ObjPtr.cpp"

int main(void)
{
    Person* ptr1 = new Student();
    Person* ptr2 = new PartTimeStudent();
    Student* ptr3 = new PartTimeStudent();
    
    ptr1-> Sleep();
    ptr2-> Sleep();
    ptr3 -> Study();
    
    delete ptr1, ptr2, ptr3;
    
    return 0;
}