//vecCaution.cpp vector iterator 주의사항


#include <iostream>
#include <vector>

//using namespace std;

template <typename T>
void PrintVector(std::vector<T>& vc)
{
	//Print all vector elements
	std::cout << "[";
	for(typename std::vector<T>::iterator itr = vc.begin(); itr!= vc.end(); ++itr)
	{
		std::cout << *itr << "  ";

	}
	std::cout << "]";
}

int main()
{
	std::vector<int> vec;
	vec.push_back(1);
	vec.push_back(2);
	vec.push_back(3);
	vec.push_back(4);
	vec.push_back(2);

	std::cout <<"first status vector"<< std::endl;

	PrintVector(vec);

	std::vector<int>::iterator itr = vec.begin();
	std::vector<int>::iterator endItr = vec.end();

	for(;itr!= endItr; ++itr)
	{
		if(*itr == 2) vec.erase(itr);
	}
    
// //위 오류를 해결하기위해 아래와 같이 수정해야한다.
// for(std::vector<int>::size_type i = 0; i != vec.size(); i++)
// {
// 	if(vec[i]==2) {vec.erase(vec.begin() + 1); i--;} //처음부터 다시찾겠다
// }
// /*그러나 비효율적이다. */

	std::cout << "value 2 delete: "<< std::endl;
	PrintVector(vec);
	return 0;
}
