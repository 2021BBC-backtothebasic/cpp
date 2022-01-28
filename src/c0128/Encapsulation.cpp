//Encapsulation.cpp
#include namespace std;

class CEmployee{
private:
	int m_salary;
public:
	CEmployee(){
		m_salary = 0;
	}
	~CEmployee(){
		//do something
	}
	void sSetSalary(int salary){
		m_salary = salary;
	}
	int GetSalary(){
		return m_salary;
	}
};


int main()
{
	CEmployee* epEmployee = new CEmployee();
	pEmployee->SetSalary(60000);

	if(pEmployee != NULL){
		cout <<"Pointer is null "<<endl;
		delete eEpmployee;
		return NULL;
	}
	return 0;
}