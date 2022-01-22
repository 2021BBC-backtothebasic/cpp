#include <iostream>

using namespace std;

namespace BestComImpl
{
	void SimplFunc(void); //
}
namespace ProgComImpl
{
	void SimplFunc(void); //
}

int main(void)
{
	BestComImpl::SimplFunc();
	ProgComImpl::SimplFunc();
}

void BestComImpl::SimplFunc(void) //
{
	cout << "BestCom이 정의한 함수 " << endl;
}

void ProgComImpl::SimplFunc(void) //
{
	cout << "ProgCom이 정의한 함수" << endl;
}
