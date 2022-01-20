#include <iostream>
#include <time.h>
using namespace std;

// int GetCurrentTime(void)
// {
//     time_t curTime = time(NULL);
//     struct tm *pLocalTime = NULL;

//     pLocalTime = localtime(&curTime); //mac
//     // pLocalTime = localtime_s(&curTime); //window

//     if(pLocalTime == NULL) 
//     {
//         // time get failure then return 0;
//         return -1;
//     }

//     // return pLocalTime-> tm_hour; // 포인터에 맴버에 접근할때 ' -> ' 를 사용
//     return pLocalTime->tm_wday;
// }

int GetCurrentDay(void){
    time_t curTime = time(NULL); //mac
    struct tm* pLocalTime = NULL; //mac
    
    // time_t curTime = time(NULL);
    // struct tm pLocalTime;

    //if (pLocalTime == NULL) //mac
    localtime_s(&pLocalTime, &curTime);
    if(&pLocalTime == NULL)
    {
        return -1;
    }
    return pLocalTime->tm_wday;
}

int main()
{
    int time = -1;
    int mDay = -1;
    // time = GetCurrentTime();
    mDay = GetCurrentDay();

        
    if(mDay < 0)
        return 129;
    switch (mDay)
    {
    case 1:
        cout << "Monday";
        break;
    case 2:
        cout << "Tuesday";
        break;
    case 3:
        cout << "Wednesday";

        break;
    case 4:
        cout << "Thursday";

        break;
    case 5:
        cout << "Friday";

        break;
    case 6:
        cout << "Saturday";

        break;
    case 7:
        cout << "Sunday";

        break;
    
    default:
        cout << "Nonday\n";
        break;
    }

    // if(time < 10)
    // {
    //     cout << "Good Morning class BLOCK4";
    // }
    // else if (time < 20)
    // {
    //     cout << "Good day class Block4";
    // }
    // else
    // {
    //     cout << "Good evening class Block4";
    // }


    // cout << "\r\n";
    return 0;    
}