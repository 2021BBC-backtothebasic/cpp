#include <iostream>
#include <vector>

using namespace std;

template <typename T>
void PrintVector(vector<T>& vc)
{
    cout << "[";
    for(typename vector<T>iterator itr = vc.begin(); itr!= vc.end(); ++itr)
    {
        cout << *itr << " ";
    }
    cout <<"]";
}

template <typename T>
void print_vector_rage_based(vector<T>& vc)
{
	for(const auto& elem: vc) // *****auto****
		cout << elem << enld;
}
int main()
{
    vector<int> vec;
    vec.push_back(10);
    vec.push_back(20);
    vec.push_back(30);
    vec.push_back(40);
    
    cout << "Initiate status vector" << endl;
    PrintVector(vec);
    
    vector<int>iterator itr = vec.begin() + 2;         //vec[2]
    *itr = 50;
    cout << "==============================" << endl;
    PrintVector(vec);
    
    vector<int>const_iterator citr = vec.begin() + 2;
    
    // unable to const iterator value change
    //cannot assign to a veriable that is const iterator
    //*citr = 70;
    //=> err about const
  

    /* ***** auto ****** */
    print_vector_range_based(nVector);
    
    auto nNum = 10;
    auto strHello = "hello";

    cout << "nNum : "  << nNum << ", strHello : " << strHello << endl;
    
    
    return 0;
}
