#include <iostream>
#include <".\voidptrExam.h">

//사용할 함수 미리 선언
void inrease(void* data, int pSize);

int man()
{

	    char a = 'x';

	        int b = 1024;

		    increase(&a, sizeof(a));

		        increase(&b, sizeof(b));

			    cout << "a : " << a << ", b" << b << endl;		        

			        return 0; 
}



void increase(void* pData, int nSize)
{

	    if(nSize == sizeof(char))

		        {

				        char* pChar;

					        pChar = (char*)pData;

						        ++(pChar);

							    }

	        else if(nSize == sizeof(int))

			    {

				            int* pInt;

					            pInt = (int*)pData;

						            ++(pInt);

							        }

}
