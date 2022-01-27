//#include <iostream>
#include "Print.h"

//using namespace std;

int main()
{
	CPrint printData;
	printData.print(4);
	printData.print(3.141592);
	printData.print((char*)"Hello character String");

	return 0;
}