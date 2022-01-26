#include <iostream>
#include <string>

using namespace std;

class Books
{
public:
    string m_Title;
    string m_Author;
    string m_Subject;
    int m_nBookId;
void PrintBookInformation(){
    cout << "Book title : " << bookObj.m_Title << endl;
    cout << "Book Author : " << bookObj.m_Author << endl;
    cout << "Book Subject : " << bookObj.m_Subject << endl;
    cout << "Book nBookId : " << bookObj.m_nBookId << endl;
}
};

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