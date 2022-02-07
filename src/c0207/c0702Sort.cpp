/* c07Sort.cpp */

#include <iostream>
#include <vector>
#include <algorithm>
#include <functional>

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


class IntCompare
{
	public:
		// DESCENDING Sorting operator
		bool operator()(const  int& a, const int& b) const {return (a>b);}
};

template <class T1, class T2>
class GreaterComp{
public:	
	bool operator()(const T1& a, const T2& b) const {return (a>b);}//
};
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

	
//	sort(vec.begin(), vec.end());

	//sort(vec.begin(), vec.end(), IntCompare());
	//sort(vec.begin(), vec.end(), GreaterComp<int, int>());
	sort(vec.begin(), vec.end(), greater<int>()); //or less<int>()
	cout <<"After Sorting\n";

	SortingPrint(vec.begin(), vec.end());

	cout <<"========\n";




	return 0;
}
