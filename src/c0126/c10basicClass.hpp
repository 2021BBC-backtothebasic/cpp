
using namespace std;

class Books
{
public:
    string m_Title;
    string m_Author;
    string m_Subject;
    int m_nBookId;
    
    //struct BooksInfo m_BooksInfo;
void PrintBookInformation(){
    cout << "Book title : " << bookObj.m_Title << endl;
    cout << "Book Author : " << bookObj.m_Author << endl;
    cout << "Book Subject : " << bookObj.m_Subject << endl;
    cout << "Book nBookId : " << bookObj.m_nBookId << endl;
}
};
