#include <iostream>
#include <time.h>
using namespace std;

//예제3
int GetCurrentTime(void)
{
   time_t curTime = time(NULL);
   struct tm pLocalTime;

   localtime_s(&pLocalTime, &curTime);


   if (&pLocalTime == NULL)
   {
      return -1;
   }

   return pLocalTime.tm_hour;
}

int GetCurrentDay(void)
{
   time_t curTime = time(NULL);
   struct tm pLocalTime;

   localtime_s(&pLocalTime, &curTime);


   if (&pLocalTime == NULL)
   {
      return -1;
   }

   return pLocalTime.tm_wday;
}

int main()
{
   int time = -1;
   int wDay = -1;
   time = GetCurrentTime();
   wDay = GetCurrentDay();


   if (time < 10)
   {
      cout << "Good Morning class BLOCK4";
   }
   else if (time < 20)
   {
      cout << "Good day class Block4";
   }
   else
   {
      cout << "Good evening class Block4";
   }

   cout << "\r\n";

   if (wDay < 0)
      return 129;

   switch (wDay)
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
      cout << "Tursday";
      break;
   case 5:
      cout << "Friday";
      break;
   case 6:
      cout << "Saturday";
   case 7:
      cout << "Sunday";
      break;
   default:
      cout << "Nonday";
      break;
   }

   return 0;
}