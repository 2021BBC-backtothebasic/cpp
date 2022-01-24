#include <iostream>

#include <random>

using namespace std;





int main()
{

	    /* userNum */

	    int userNum[2];

	            

	        randNum
		
		   random_device rd;
		
		       mt19937 gen(rd());
		
		           uniform_int_distribution<int> dis(0, 9);
		
		               /* computer Num */
		
		                   int cNum[2];
		
		                       
		
		                           /* get Result */
		
		                               for( int i = 0; i< 3; i++)
		
		                                   {
		
		                                           cNum[i] = dis(gen);
		
		                                                   cout << "\n숫자를 입력해주세요 \n >>"<< i+1 << "회차 : ";
		
		                                                           cin >> userNum[i];
		
		                                                                   cout << "\n\n "<< i+1 <<"회차 컴퓨터가 선택한 숫자는 : " << cNum[i] << "입니다. " << endl;
		
		                                                                           cout << "플레이어의 입력값은 : " << userNum[0] << "입니다." << endl<< endl;
		
		                                                                                   
		
		                                                                                           int strike = 0, ball = 0, homerun=0;
		
		                                                                                                   if(cNum[i] == userNum[i]) { strike++;}
		
		                                                                                                           if(cNum[i] != userNum[i] && cNum[i] == userNum[i+1] || cNum[i]==userNum[i+2] || cNum[i] == userNum[i-1]|| cNum[i] == userNum[i-2]) { ball++; strike--;}
		
		                                                                                                                   if(homerun == 0) {cout << "\nstrike : "<<strike << ", ball : " << ball << endl;}
		
		                                                                                                                           if(homerun ==1) {cout << "\n홈런입니다!! 게임을 승리했습니다! " << endl;}
		
		
		
		                                                                                                                               }
		
		                                                                                                                                   
		
		                                                                                                                                       
		
		                                                                                                                                           
		
		                                                                                                                                               
		
		                                                                                                                                                   return 0;
		
		                                                                                                                                                   }
