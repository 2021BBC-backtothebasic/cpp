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
    
    
    
    return 0;
}