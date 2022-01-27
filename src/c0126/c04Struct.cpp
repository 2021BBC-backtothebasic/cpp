#include <iostream>

using namespace std;


int main()
{
	struct Books SetBooksInformation(char* title, char* author, char* subject, int bookId)
    {
     
        
        struct Books book3 = SetBooksInformation((char*)"Welcome to C++", (char*)"Bjane stroustoup", (char*)"C++", 34534);
        PrintBooksInformation(&book3);
        delete book1;
        //delete book2;
    }
}


