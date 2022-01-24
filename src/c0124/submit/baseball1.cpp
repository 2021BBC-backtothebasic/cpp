#include <iostream>
#include <random>

using namespace std;

int main()
{
	    /* userNum */
	    int userNum[2];

	    //randNum
		random_device rd;
		mt19937 gen(rd());
		
		uniform_int_distribution<int> dis(0, 9);
		
		/* computer Num */
		int cNum[2];
        for( int i = 0; i< 3; i++)
		{
		 cNum[i] = dis(gen);
		 cout << "\n숫자를 입력해주세요 \n >>"<< i+1 << "회차 : ";
		 cin >> userNum[i];
		 cout << "\n\n**"<< i+1 <<"회차 컴퓨터가 선택한 숫자는 : <" << cNum[i] << ">입니다. " << endl;
		 cout << "플레이어의 입력값은 : <" << userNum[i] << ">입니다." << endl<< endl;
		                                                                                               /* get Result */
		int strike = 0, ball = 0, homerun=0;
		if(cNum[i] == userNum[i]) { strike++;}
		if( cNum[i] != userNum[i] 
		    && cNum[0] == userNum[1]
		    || cNum[0] == userNum[2]) { ball++;}
		else if( cNum[i] != userNum[i] 
		    && cNum[1] == userNum[0]
		    || cNum[1] == userNum[2]) { ball++;}
		else if( cNum[i] != userNum[i] 
		    && cNum[2] == userNum[0]
		    || cNum[2] == userNum[1]) { ball++;}
		if(homerun == 0) {cout << "\nstrike : "<<strike << ", ball : " << ball << endl;}
		if(homerun ==1) {cout << "\n홈런입니다!! 게임을 승리했습니다! " << endl;}
}
		
		                                                                                                                                                                                                                                                 
		
		                                                                                                                                                                                                                                                     
		
		                                                                                                                                                                                                                                                         
		
		                                                                                                                                                                                                                                                             
		
		                                                                                                                                                                                                                                                                 return 0;
		
		                                                                                                                                                                                                                                                                 }
