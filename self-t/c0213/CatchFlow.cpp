/* CatchFlow */
using namespace std;

class AAA
{
public:
	void ShowYou() { cout << "AAA exception!" << endl;}
};

class BBB: public AAA
{
public:
	void ShowYou() { cout << "BBB exception!" << endl;}
};

class CCC: public BBB
{
	public:
		void ShowYou() { cout << "CCC exception!" << endl;}
}

void ExceptionGenerator(int expn)
{
	if(expn ==1)
		throw AAA();
	else if(expn==2)
		throw BBB();
	else
		throw CCC();
}
