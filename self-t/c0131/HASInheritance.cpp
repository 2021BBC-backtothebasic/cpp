#include <iostream>
#include <cstring>

using namespace std;

class Gun
{
private:
    int bullet;
public:
    Gun(int bnum) : bullet(bnum){}
    void Shut() 
    {
        cout <<"BBANG!" <<endl;    
        bullet--;
    }
};

class Police : public Gun
{
private:
    int handcuffs;
public:
    Police(int bnum, it bcuff)
        : Gun(bnum), handcuffs(bcuff){}
    void PutHandcuff()
    {
        cout << "SNAP!" << endl;
        handcuffs--;
    }
};

int main(void)
{    
    Police pman(5, 3);
    pman.Shut();
    pman.PutHandcuff();
    
    return 0;
}