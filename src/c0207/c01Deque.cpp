// c01Deque.cpp
#include <iostream>
#include <deque>

using namespace std;

template <typename T>
void PrintDeque(deque<T> dq)
{
	cout << "[ ";
	for (const auto& ele : dq)
		cout << ele << " " ;
	cout << "]\n";
}

int main()
{
	deque<int> dq;
	dq.push_back(10);
	dq.push_back(20);
	dq.push_back(30);
	dq.push_back(40);


	cout << "Initial status of deque" << endl;
	PrintDeque(dq);

	cout << "delete front element" << endl;
	dq.pop_front();
	PrintDeque(dq);

	return 0;
}
