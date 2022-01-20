#include <iostream>
// #include <stdio.h> //mac
#include <stdlib.h> //only window
using namespace std;

int main ()
{   
		char strVar[100] = {0, }; 
		int iVar = 0;
		printf("Input text and number: ");

        //& 메모리에 직접받는다.
		// scanf_s("%s %d", strVar, &iVar);  (mac) 
        scanf_s("%s %d", strVar, _countof(strVar), &iVar, 1); //window
        
	
		printf("\n Your entered text and number : %s, %d \n", strVar, iVar);
		
		return 0;
}