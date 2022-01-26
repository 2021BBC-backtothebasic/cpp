#include <iostream>

using namespace std;



struct Books
{
	char title[50];
	char author[50];
	char subject[100];

	int book_id;
};

//
void PrintBooksInformation(struct Books book);

int main()
{
	//struct Books book1;
	//struct Books book2;
	Books* book1 = new Books;
	Books* book2 = new Books;

	strcpy(book1->title, "learn C++ Programming 21 days");
	strcpy(book1->author, "Sieun Lee");
	strcpy(book1->subject, "C++ Programming in liquore");
	
	book1->book_id = 123423;
	

	strcpy(book2->title, "Lern C Programming 21days");
	//윈도우 예제는 이렇다.
	// strcpy_s(book2.tile, _countof(book2.tile), "Learn C Programming 21days");
	strcpy(book2->author, "Taesu Jung");
	strcpy(book2->subject, "C Programming in liquore");
	book2->book_id = 4323;
	PrintBooksInformation(Books* book);

	cout << "book1 title : " << book1->title << ", author : " << book1->author << ", Subject : " << book1->subject << ", book1 subject" << endl;
	cout <<"book2 title: " << book2->title<< ", author : " << book2->author << ", book2 subjecct : " << book2->subject<< endl;
	PrintBooksInformation(Books* book);

	delete book1;
	delete book2;

	return 0;
}


//다른파일
void PrintBooksInformation(Books* book)
{
	cout << "book title : "<< book->title << ", book Subject : " << book->author << ", book subject : " << book->subject << ", book id: " << book->book_id << endl;
}
