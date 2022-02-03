#include <iostream>
#include <fstream>

using namespace std;

int main(void)
{
    ofstream file("simplefile.txt");
    file << "Hello fileStream!";
    
    file.close();
    
    return 0;
}