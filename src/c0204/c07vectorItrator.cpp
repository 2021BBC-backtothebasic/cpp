#include <iostream>
#include <vector>

using namespace std;

template <typename T>
void PrintVector(vector<T>& vc)
{
	for(typename vector<T>::iterator itr = vc.begin(); itr != vc.end(); ++itr)
		cout << *itr << endl;
}

int main(void) ///배열쓰는것보다 좋다
{
	vector<int> vec;
	vec.push_back(1);
	vec.push_back(2);
	vec.push_back(3);
	vec.push_back(4);

	cout << "first vector state "<<endl;
	PrintVector(vec);

	cout <<"================================"<< endl;

	// insert before vec[2]
	vec.insert(vec.begin() + 2, 55);
	PrintVector(vec);

	cout << "==============================="<< endl;

	// erase vec[3]
	vec.erase(vec.begin()+3);
	PrintVector(vec);


	return 0;
}
