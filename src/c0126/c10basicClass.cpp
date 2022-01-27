#include <iostream>
#include <string>
#include "c10basicClass.hpp"
int main()
{
    Books booksObj;
    Books bookObj;
    booksObj.m_Title = "Learn C++ 21days";
    booksObj.m_Author = "SiEun Lee";
    booksObj.m_Subject = "Learning C++ Programming";
    booksObj.m_nBookId = 19980225;
    
    booksObj.PrintBookInformation();
    
    Books cppBook;
    cppBook.m_Title = "Learn C++ 21days";
    cppBook.m_Author = "TsJung";
    cppBook.m_Subject = "Learning C++ Programming";
    cppBook.m_nBookId = 1998099225;
    
    cppBook.PrintBookInformation();
    
    return 0;
}