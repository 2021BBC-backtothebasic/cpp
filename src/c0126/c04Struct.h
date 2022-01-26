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
        struct Books SetBooksInformation(char* title, char* author, char* subject, int BookId)
        {
            struct Books book;
            strcpy(book.title, title);
            strcpy(book.author, author);
            strcpy(book.subject, subject);
            book.book_id = bookId;
            
            //forwindow
            // strcpy(book.title, title);
            // strcpy(book.author, author);
            // strcpy(book.subject, subject);
            // book.book_id = bookId;
            
            return book;
            
        }
}

