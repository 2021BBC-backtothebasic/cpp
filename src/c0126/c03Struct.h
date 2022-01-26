//c03bookstruct.h
using namespace std;
namespace BooksInfo
{
    struct Books
    {
        char title[50];
        char author[50];
        char subject[100];

        int book_id;
    }
	void PrintBooksInformation(Books* book)
{
	cout << "book title : "<< book->title << ", book Subject : " << book->author << ", book subject : " << book->subject << ", book id: " << book->book_id << endl;
}
}

