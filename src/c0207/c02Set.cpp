//c02Set.cpp
include <iostream>
#include <set>

using namespace std;

template <typename T>
void PrintSetElement(set<T>& s)
{
	cout << "[ " ;
	for(typename set<T>::iterator itr = s.begin(); itr!= s.end(); ++itr)
		cout << *itr << endl;
		//포인터연산자를 재정의해서 마치 참조연산자처럼 사용한다
	cout << "]\n";
		
}


int main()
{
	set<int> s;

	s.insert(10);
	s.insert(50);
	s.insert(20);
	s.insert(30);
	s.insert(40);

	cout << "Initial status set : sorted print" << endl;
	PrintSetElement(s);

	cout << "20 is s element ? :: ";
    
    //set<int>::itrator itr = s.find(20);
	auto itr = s.find(20); //auto로 적용해보기 //어떠한 변수라도 적용됨
    
    
    
	if(itr != s.end())
		cout << "Yes" << endl;
	else
		cout << "No" << endl;

	cout << "25 is a element ? :: ";
	if(itr != s.end())
		cout << "Yes" << endl;
	else
		cout << "No" <<endl;


    
    
    
    /* auto 예제이긴한데 특수한 상황에서만 쓰길 권장
    auto nNumber = 10;
    auto strHello = "World!";
    int n[10] = {1,2,3,4,5,6,7,8,9,10};
    for (auto i : n){
        cout << i;
    }*/
	return 0;
}
