#include <iostream>
using namespace std;

int main()
{
	int grade[3] = {85, 65, 90 };

	cout << grade << endl;
	
    for(int i = 0; i< 3; i++)
    {
        cout << grade[i] << endl;
        cout << "memory address " << &grade[i] << endl;
        // &grade == 참조메모리 
        
        
        //cout << *(&grade + i) << endl;
     }
    
    return 0;
}