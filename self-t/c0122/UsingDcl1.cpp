#include <iostream>

using namespace std;

namespace Hybrid
{
	void HybFunc(void)
	{
		cout << "So simple function!" << endl;
		cout << "In namespace Hybrid!" << endl;
	}
}

int main(void)
{
	using Hybrid::HybFunc;
	HybFunc();

	return 0;
}
