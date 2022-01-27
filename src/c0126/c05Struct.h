//c03bookstruct.h
using namespace std;
namespace BooksInfo
{
        // struct Books //원형
        // {
        //     char title[50];
        //     char author[50];
        //     char subject[100];

        //     int book_id;
        // }
    
    // type struct Books 
        // {
        //     char title[50];
        //     char author[50];
        //     char subject[100];

        //     int book_id;
        // }
        typedef struct Books 
        {
            char title[50];
            char author[50];
            char subject[100];

            int book_id;
        }    BooksTag;
    
    
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

