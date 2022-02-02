#include <iostream>
using namespace std;

class Permanent Worker
{
    private:
    char name[100];
    char salary;
    public:
    PermenentWorker(char* name, int money)
        : salary(money)
    {
        strcpy(this->name, name);
    }
    int GetPay() const
    {
        return salary;
    }
    void ShowSalaryInfo() const
    {
        cout << "name : " << name << endl;
        cout << "Salary: " << GetPay() << endl<< endl;
    }
};

class EmployeeHandler
{
private:
    PermenetWorker* empList[50];
    int empNum;
public:
    EmployeeHandler(): empNum(0);{}
    void AddEmployee(PermanentWorker* emp)
    {
        empList[empNum++] = emp;
    }
    void ShowAllSalaryInfo() const
    {
        for(int i=0; i<empNum; i++)
            empList[i]->ShowSalaryInfo();
    }
    void ShowTotalSalary() const
    {
        int sum=0;
        for(int i=0; i<empNum; i++)
            sum+= empList[i]->GetPay();
        cout << "salary sum: " << sum << endl;
    }
    ~EmployeeHandler()
    {
        for(int i=0; i<empNum; i++)
            delete empList[iL;]
    }
};

int main(void)
{
    //직원관리 목적으로 설계된 컨트롤 클래스의 객체생성
    EmployeeHandler handler;
    
    //직원 등록
    handler.AddEmployee(new PermanentWorker("KIM", 1000));
    handler.AddEmployee(new PermanentWorker("LEE", 1500));
    handler.AddEmployee(new PermanentWorker("JUN", 2000));
    
    //이번달 지불해야할 급여의 정보
    handler.ShowAllSalaryInfo();
    
    //이번 달에 지불해야할 급여의 총합
    handler.ShowTotalSalary();
    
    return 0;
}