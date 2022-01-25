//FunctionPointerExm.cpp
#include <iostream>
using namespace std;

double Add(double, double);//prototype
double Sub(double, double);//prototype
double Mul(double, double);//prototype
double Div(double, double);//prototype
double Calc(double, double, double(*func)(double,double));

int main()
{
	double (*calc)(double, double) = nullptr; // Define function pointer
	double dNum1 = 3., dNum2 = 4., result = 0.; //실수처리
	char oper = '*'; //지정해서 사용할 수 있음 + - / *
	
	switch (oper)
	{
		case '+':
			calc = Add;
			break;
		case '-':
			calc = Sub;
			break;
		case '*':
			calc = Mul;
			break;
		case '/':
			calc = Div;
			break;
		default:
			cout << "Support(+, -, *, /)" << endl;
			break;
	}
    cout << "The result : " << result << endl;
    result = Calc(dNum1, dNum2, calc);
	return 0;
}

//원래는 바깥 파일에 두는것.
double Add(double dNum1, double dNum2)
{
	return dNum1 + dNum2;
}
double Sub(double dNum1, double dNum2)
{
	return dNum1 - dNum2;
}
double Mul(double dNum1, double dNum2)
{
	return dNum1 * dNum2;
}
double Div(double dNum1, double dNum2)
{
	return dNum1 / dNum2;
}


double Calc(double dNum1, double dNum2, double(*func)(double,double))
{  
	return (func(dUNum1, dNum2));
}