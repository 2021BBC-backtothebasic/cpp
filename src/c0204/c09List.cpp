#include <iostream>
#include <list>
using namespace std;

int main(void)
{
	list<int> nList;

	
	nList.push_back(10);
	nList.push_back(20);
	nList.push_back(30);
	nList.push_back(40);

	for(list<int>::iterator itr = nList.begin(); itr != nList.end(); ++itr)
		cout << *itr << endl;

	return 0;
}
