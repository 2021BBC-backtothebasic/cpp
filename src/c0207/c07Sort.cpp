/* c07Sort.cpp */

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

template <typename T>
void SortingPrint(T begin, T end)
{
	while(begin != end){
		cout << *begin << " ";
		begin ++;

	}
	cout << endl;
}

int main(void)
{
	vector<int> vec;
	vec.push_back(5); //vector의 insert내장함수 = push_back
	vec.push_back(2);
	vec.push_back(3);
	vec.push_back(1);
	vec.push_back(4);
	vec.push_back(8);
	vec.push_back(6);
	vec.push_back(7);

	SortingPrint(vec.begin(), vec.end());

	
	sort(vec.begin(), vec.end());
	cout <<"After Sorting\n";

	SortingPrint(vec.begin(), vec.end());


	return 0;
}
