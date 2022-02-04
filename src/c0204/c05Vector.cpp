#include <iostream>
#include <vector>


using namespace std;

int main()
{
	vector<int> vec;

	vec.push_back(10);
	vec.push_back(20);
	vec.push_back(30);
	vec.push_back(40);

	for(vector<int>::size_type i = 0; i< vec.size(); i++)
	{
		cout << "Vec " << i << " : "  << vec[i] << endl;
	}

	cout << "H";

	return 0;
}

