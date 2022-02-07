// c04ClassSet.cpp

#include <iostream>
#include <set>
#include <string>

using namespace std;

template <typename T>
void PrintSetElement(set<T>& s)
{
	for(const auto& ele: s){
		cout << ele << " " <<endl;
	}
}

class Todo
{
private:
	int priority;
	string jobDesc;
public:
	Todo(int nPriority, string strJobDesc) 
		: priority(nPriority),
		jobDesc(strJobDesc)
	{
	}
#if 0   //disable
	bool operator<(const Todo& t) const   //operator 정의할때 < 써줘야한다.
	{
		if(priority == t.priority)
			return jobDesc < t.jobDesc; //true or false

		return priority > t.priority;
	}
#endif

	friend class TodoCmp;// **

	friend ostream& operator<<(ostream& o, const Todo& td);
};

class TodoCmp //위 주석 내용대신 TodoCmp에서 정의
{
	public:
	bool operator()(const Todo& t1, const Todo& t2) const
	{
		if(t1.priority == t2.priority)
			return (t1.jobDesc < t2.jobDesc);

		return (t1.priority > t2.priority);
	}
};

ostream& operator<<(ostream& o, const Todo& td)
{
	o << "[Priority : " << td.priority << "]" << td.jobDesc;
	return o;
}

int main()
{
//	set<Todo> todos;
	set<Todo, TodoCmp> todos;

	todos.insert(Todo(1, "exercise C++"));
	todos.insert(Todo(2, "exerciese math"));
	todos.insert(Todo(1, "Programming project"));
	todos.insert(Todo(3, "Meet friends"));
	todos.insert(Todo(3, "Watching movie"));
	
	PrintSetElement(todos);

	cout << "=================================================================="<< endl;
	cout << " if you complete excersize math " << endl;
	todos.erase(todos.find(Todo(2, "exercise math")));

	PrintSetElement(todos);

	return 0;
}
