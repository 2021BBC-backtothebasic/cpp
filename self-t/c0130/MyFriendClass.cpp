#include <iostream>
#include <cstring>

using namespace std;

class Girl;

class Boy
{
private: 
    int height;
    friend class Girl;
public:
    Boy(int len) : height(len)
    {    }
    void ShowYourFirendInfo(Girl &frn);
};

class Girl
{
private:
    char phNum[20];
public:
    Girl(char* num)
    {
        strcpy(phNum, num);
    }
    void ShowYourFirendInfo(Boy &frn);
    friend class Boy;
};

void Boy::ShowYourFirendInfo(Girl &frn)
{
    cout <<"Her phone number: " << frn.phNum << endl;
}
void Girl::ShowYourFirendInfo(Boy &frn)
{
    cout << "His height: " << frn.height << endl;
}

int main(void)
{
    Boy boy(170);
    Girl girl("010-1234-1234");
    
    boy.ShowYourFirendInfo(girl);
    girl.ShowYourFirendInfo(boy);
    
    return 0;
}