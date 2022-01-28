//Person.h
//#pragma once
#ifndef __PERSON_H__
#define __PERSON_H__
#include <iostream>
#include <string>
using namespace std;

class CPerson{
private:
	string m_strName;
	int m_nAge;
public:
	//항상 생성자와 파괴자를 상단에 세팅하자
	CPerson(const string& strName, int nAge);
	~CPerson();

	static int m_nPersonCount;
	static int PersonCount();
	void ShowPersonInformation();

};

int CPerson::m_nPersonCount = 0; //Initialize static member variable

#endif