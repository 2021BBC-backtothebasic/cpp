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
    
    
    cout << "=============================" << endl;
    cout << "Reverse Vector Print" << endl;
    vector<int>::reverse_iterator ritr = vec.rbegin();
    
    cout << "[";
    for(;ritr != vec.rend(); ritr++)
    {
        cout << *ritr << " ";
    }
    cout << "]\n";
    
    
    vector<int> nVector;
    nVector.push_back(1);
    nVector.push_back(2);
    nVector.push_back(3);
    
    //reverse print
    for(vector<int>::size_type i = nVector.size()-1; i < >=0; i--)//거꾸로 출력하기
    {
            cout << nVector[i] << endl;
        
    }
    
    return 0;
}