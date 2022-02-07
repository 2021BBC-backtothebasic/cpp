/* c08partialSort.cpp */
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

template <typename T>
void Printvector(T begin, T end) ; //iterator 받아주는것
{
	while(begign != end)
	{

		cout << *begin << " ";
		begin++;
	}
	cout << endl;
}
int main(void)
{
	vector<int> vec;
	
	vec.back_push(5);
	vec.back_push(2);
	vec.back_push(3);
	vec.back_push(1);
	vec.back_push(4);
	vec.back_push(8);
	vec.back_push(6);
	vec.back_push(7);

	cout << "before sorting\n";
	PrintVector(vec.begin(), vec.end());


	std::partial_sort(vec.begin(), vec.end()); /* #include <functional> 있을경우 greater<int>() 가능*/

	cout << "After sorting\n";
	PrintVector(vec.begin(), vec.end());


	return 0;
}
