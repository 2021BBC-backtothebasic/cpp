#include <iostream>
#include <list>
using namespace std;

template <typename T>
void PrintList(list<T>& lst)
{
	cout << "[";
	for (const auto& ele : lst)
		cout  << ele << " ";
	cout << "]\n";
		}

int main(void)
{
	list<int> nList;

	
	nList.push_back(10);
	nList.push_back(20);
	nList.push_back(30);
	nList.push_back(40);


	cout << "======================================"<< endl;
	//print of list
	
	for(list<int>::iterator itr = nList.begin(); itr != nList.end(); ++itr)
		cout << *itr << endl;

	cout <<"======================================="<< endl;
	//insert of list
	cout << "Initial satatus at list" << endl;
	PrintList(nList);
	
	for(list<int>::iterator itr = nList.begin(); itr != nList.end(); ++itr)
		if(*itr ==20) nList.insert(itr, 50);

	cout << "element value before 20 insert 50" << endl;
	PrintList(nList);



	// delete of listi
	for(list<int>:: iterator itr = nList.begin(); itr != nList.end(); ++itr){
		if(*itr ==30) {
			nList.erase(itr);
			break;//지워졌으면 for문 탈출시켜야함
		}
}

	cout <<"element value 30 deleted" << endl;
	PrintList(nList);

	return 0;
}
