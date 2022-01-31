#include <iostream>
using namespace std;

class SoBee
{
private:
    int baseNum;
public:
    SoBee(int n) : baseNum(n)
    {
        cout <<"SoBase() : " << baseNum << endl;
    }
    ~SoBase()
    {
        cout << "~SoBase() : " << baseNum << endl;
    }
};

class SoDerived : public SoBase
{
private:
    int derivNum;
public:
    SoDerived(int n) : SoBase(n), dirivNum(n)
    {
        cout << "SoDeriv() : " << derivNum << endl;
    }
    ~SoDerived()
    {
        cout << "~SoDerived() : " << derivNum << endl;
    }
};

int main(void)
{
    SoDerived drv1(15);
    SoDerived drv2(27);
    
    return 0;
}