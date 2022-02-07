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

template <typename K, typename V>
void PrintMultiMap(const multimap<K, V>& mm){
	for(const auto& kv : mm)
		cout << kv.first << ", " << kv.second << endl;
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

	cout <<"====================================================\n";

	multimap<int, string> mm;
	mm.insert(make_pair(1, "hello MultiData"));
	mm.insert(make_pair(1, "hello C++"));
	mm.insert(make_pair(2, "hello React"));
	mm.insert(make_pair(2, "hello Js"));
	mm.insert(make_pair(2, "hello nodejs"));

	PrintMultiMap(mm);

	cout << "--------------------------------------------------\n";

	cout << mm.find(1)->second << endl;

	return 0;
}
