/* c06MultiDataStruct.cpp MultiSet과 MultiMap*/

#include <iostream>
#include <set>
#include <string>

using namespace std;

template <typename T>
void PrintMultiSet(const multiset<T>& ms)
{
	for(const auto& ele : ms)
		cout << ele << endl;
}

int main(void)
{
	multiset<string> ms;

	ms.insert("a");
	ms.insert("b");
	ms.insert("a");
	ms.insert("c");
	ms.insert("d");
	ms.insert("c");

	PrintMultiSet(ms);

	return 0;
}
