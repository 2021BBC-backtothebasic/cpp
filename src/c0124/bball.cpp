#include <iostream>
#include <random>

using namespace std; 

int main()
{
    /* userNum */
    int userNum[3];

    //randNum
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<int> dis(0, 9);

    //computer Num 
    int cNum[3];
    
    while (1) {
        int strike = 0, ball = 0, homerun = 0; int out;
        for (int i = 0; i < 3; i++)
        {
            cNum[i] = dis(gen);
            cout << "\n숫자를 입력해주세요 \n >>" << i + 1 << "회차 : ";
            cin >> userNum[i];
            if(cin.fail()){ cin.clear(); cin.ignore(10, '\n');cout << "숫자로 다시 입력해주세요! \n >>" << endl; cin >> userNum[i];}
            cout << "\n**" << i + 1 << "회차 \n컴퓨터가 선택한 숫자는 : <" << cNum[i] << ">입니다. " << endl;
            cout << "플레이어의 입력값은 : < " << userNum[i] << " >입니다." << endl;
        }
        
        
        int cRes = 100 * cNum[0] + 10 * cNum[1] + cNum[2];
        int userRes = 100 * userNum[0] + 10 * userNum[1] + userNum[2];

        cout << "컴퓨터가 뽑은 수 : " << cRes << endl;
        cout << "내가 뽑은 수 : " << userRes << endl;
        /* get Result */
        for (int i = 0; i < 3; i++) {
            //if (userNum[i] == cNum[i]) { strike++; }
            (cNum[i] == userNum[i]) ? strike++
            : (0 == i && userNum[i] == cNum[i + 1]) ? ball++
            : (0 == i && userNum[i] == cNum[i + 2]) ? ball++
            : (1 == i && userNum[i] == cNum[i + 1]) ? ball++
            : (1 == i && userNum[i] == cNum[i - 1]) ? ball++
            : (2 == i && userNum[i] == cNum[i - 1]) ? ball++
            : (2 == i && userNum[i] == cNum[i - 2]) ? ball++ : out++;
        }

        if (cNum[0] == userNum[0] && cNum[1] == userNum[1] && cNum[2] == userNum[2]) { homerun++; }

        if (homerun == 1) { cout << "\n홈런입니다!! 게임을 승리했습니다! " << endl; return 0; }
        if (homerun == 0) { 
            cout << "\x1B[2J\x1B[H";
            cout << "컴퓨터 선택값" << cNum[0] << cNum[1] << cNum[2] << ", 플레이어 선택 넘버" << userNum[0] << userNum[1] << userNum[2] << endl;
            cout << "\n 이전 게임의 결과!! strike : " << strike << ", ball : " << ball << endl << endl<<endl;
            cout << "**게임을 다시 시작합니다**" <<endl; 
        }
    }
    
    return 0;
}
