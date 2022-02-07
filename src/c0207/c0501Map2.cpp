/* c05Map.cpp */

#include <iostream>
#include <map>
#include <string>

using namespace std;

template <typename K, typename V>
void PrintMapElement(map<K, V>& m)  // Key와 Value의 ref타입으로 받아서 출력하겠다
{
	for(auto itr = m.begin(); itr!= m.end(); ++itr)
		cout << itr->first /*Key*/ << ", " << itr->second /*Value*/ << endl;

}

template <typename K, typename V>
void SearchPrintElement(map<K, V>& m, K key){
	auto itr = m.find(key);
	if(itr != m.end())
		cout << key << " => " << itr->second /*Value*/ << endl;
	else
		cout << key << " is not found in map =============" << endl;
}

int main(void)
{
	map<string, double> pitcherList; //야구선수 방어율 예제로 하겠다.


	//실수로 틀릴 수 있으니 key 숫자로 하는것을 권함
	//
	pitcherList.insert(std::pair<string, double>("Kershaw", 0.12));
	pitcherList.insert(std::pair<string, double>("DDung", 7.90));
	pitcherList.insert(std::pair<string, double>("Otani", 5.34));

	pitcherList.insert(std::make_pair("Chanho", 2.12));
	pitcherList.insert(std::make_pair("SunWoo", 3.14));
	pitcherList.insert(std::make_pair("KwangHyun", 3.55));

	pitcherList["DongRyul"] = 3.45; 
	pitcherList["DongWon"] = 1.67;
	pitcherList["Choo"] = 2.51;

	PrintMapElement(pitcherList);

	std::cout<< "Chanho's ERA : " << pitcherList["Chanho"] << endl;
	pitcherList["Choo"] = 8.51;
	std::cout << "Choo's ERA : " << pitcherList["Choo"] << endl;

	SearchPrintElement(pitcherList, string("Chaboom")); //해당함수가 Template을 사용했기 때문에 사용할때는  string이라고 정히 명시
	SearchPrintElement(pitcherList, string("Otani"));

	return 0;
}
