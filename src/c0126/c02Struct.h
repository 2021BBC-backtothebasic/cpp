//c02bookstruct.h
struct Books
{
	char title[50];
	char author[50];
	char subject[100];

	int book_id;
}

void PrintBooksInformation(Books* book);
