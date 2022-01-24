#include <iostream>
#include <cstring>

using namespace std;
int main()
{
	const char* pStr = "This is character string pointer";
	//나중에는 파일내용을 아래 메모리에 직접 가져올 수 있음.
	char* pStrDest = (char*)calloc(strlen(pStr) +1 , sizeof(char));

	cout << "pStrDes Length : " << strlen(pStrDest) << endl;
	strncpy(pStrDest, pStr, strlen(pStr) + 1);
	cout << "pStrDes Length : " << strlen(pStrDest) << endl;
	cout << "pStrDest : " << pStrDest << endl;

	free(pStrDest);//미리 free
	return 0;
}
