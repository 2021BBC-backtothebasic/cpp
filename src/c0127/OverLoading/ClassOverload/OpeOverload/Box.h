//Box.h
#pragma once
#include <iostream>
using namespace std;

class CBox
{
public:
	//CBox() {};//Default Object Instance
	//but
	CBox() {
		m_length;
		m_breath;
		m_height;
	};//variable initialize
	~CBox() {};//Destructor
	
	double GetVolume(void); //non parameter Declaration 
	void SetLength(double length);
	void SetBreath(double breath);
	void SetHeight(double height);

	CBox operator+(const CBox&);
	//CBox operator*(const CBox&); //연산을 위한 선언부 but error

private:// private아래에 변수를 선언하는 이유?
	double m_length;
	double m_breath;
	double m_height;
};

