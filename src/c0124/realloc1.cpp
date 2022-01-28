#include <iostream>

using namespace std;

int main()
{
	    char cAlphabet, *pAlphabet, *ptr;
        pAlphabet = (char*)calloc(35, sizeof(char));
        if(pAlphabet == NULL)
        {
                cout << "Dynamic memory allocation fail..."<< endl;
                exit(1);
        }
        ptr = pAlphabet;
        for(cAlphabet = 0x41; cAlphabet < 0x5B; cAlphabet++)
        {
            *ptr++ = cAlphabet;
            *ptr = '\0';
            cout << "Alphabet String : " << pAlphabet << endl;
            free(pAlphabet);
            return 0;
}




