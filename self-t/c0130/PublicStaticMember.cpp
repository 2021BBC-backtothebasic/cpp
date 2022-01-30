#include <iostream>
using namespace std;

class SoSimple
{
public:
    static int simObjCnt;
public:
    SoSimple()
    {
        simObjCnt++;
    }
};
int SoSimple::simObjCnt=0;

int main(void)
{
    cout << SoSimple::simObjCnt << " SoSimple " << endl;
    
    SoSimple sim1;
    SoSimple sim2;
    
    cout << SoSimple::simObjCnt << "  Simple " << endl;
    
    cout << sim1.simObjCnt << " Simple.. " << endl;
    cout << sim2.simObjCnt << " Simpl2 " << endl;
    
    return 0;
}