#include <iostream>
#include <set>


template <typename T>
void print_set(set<t> s){

}
int main()
{

	set<int> nSet;
	nSet.insert(10);
	nSet.insert(20);
	nSet.insert(10);
	nSet.insert(30);
	nSet.insert(20);
	nSet.insert(40);


	cout << "nSet : " << endl;
	PrintSetElement(nSet);

	return 0;
}
