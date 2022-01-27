#pragma once
#include <iostream>
using namespace std;

class CBook
{
private:
	int m_nCurrentPage;
	void SetPercent();

public:
	CBook(); //default 객체생성자
	//복사생성자  CBook(const CBook&);
	CBook(const string& title, int nTotalPage); //타입만 맞으면 구현체에서 파라미터 변수는 달라도된다.

	string m_strTitle;
	int m_nTotalPage;
	double m_fPercent;
	void Move(int nPage);
	void Open();
	void Read();


	//복사생성자
	const CBook& ThickerBook(const CBook&);
};

