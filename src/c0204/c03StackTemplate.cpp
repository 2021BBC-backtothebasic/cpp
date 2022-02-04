#include <iostream>
#include <vector>
#include <cstdlib>
#include <string>
#include <stdexcept>
using namespace std;

template <class T> 
class CStack{
private:
	vector<T> elements;

public:
	void push(T const&); 	// push element
	void pop();		// pop element
	T top() const;		// return top element

	//vector empty check function
	bool empty() const{
		return elements.empty();
	}
};


int main()
{

	try
	{
		CStack<int>	nStack;		// integer stack
		CStack<string>	strStack;	// string stack

		// mainuplate intiger
		nStack.push(25);
		cout << "nStack top element : " << nStack.top() << endl;

		// manipulate string stack
		strStack.push("Hello Stack!");
		cout << "strStack top element : " << strStack.top() << endl;


		strStack.pop();
		strStack.pop();//두번하면 에러가 날것!
	}
	catch(const std::exception& exc)
	{
		cerr << "err! --  Exception : " << exc.what() << endl;

		return -1;//비정상종료 처리
	}
	cout << "H";

	return 0; //정상종료
}

template <class T>
void CStack<T>::push(T const& elem)
{
	elements.push_back(elem); //vector의 내장함수 push_back
}

template <class T>
void CStack<T>::pop()
{
	if(elements.empty())
	{
		throw out_of_range("CStack<>:::pop() : empty stack");
	}

	// remove last element
	elements.pop_back(); //내장함수
}

template <class T>
T CStack<T>::top() const
{
	if(elements.empty())
	{
		throw out_of_range("CStack<>::pop() : empty stack");
	}

	//return copy of last(top) element
	return elements.back();
}

