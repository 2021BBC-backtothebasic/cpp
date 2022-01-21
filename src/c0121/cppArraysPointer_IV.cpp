#include <iostream>
#include <string> /*add*/
using namespace std;

int main()
{
	string itCompany[] = {"Apple", "Microsof", "IBM", "Amazon", "ESP Guitar" };
    
	for (int i = 0; i< (sizeof(itCompany) / sizeof(itCompany[0] )); i++){
	cout << "size of nNumber[" << i << "]" << nNumber[i] << endl;   
	}
			
    return 0;
}