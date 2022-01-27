//CBox.cpp
#include "Box.h"


//구현체
double CBox::GetVolume(void)
{
	return m_length * m_breath * m_height;
}

void CBox::SetLength(double length)
{
	m_length = length;
}
void CBox::SetBreath(double breath) {
	m_breath = breath;
}
void CBox::SetHeight(double height) {
	m_height = height;
}
CBox CBox::operator+(const CBox& b) { // Box vs Box addition
	CBox box;
	box.m_length = this->m_length + b.m_length;
	box.m_breath = this->m_breath + b.m_breath;
	box.m_height = this->m_height + b.m_height;

	return box;
}

//CBox CBox::operator*(const CBox& b) { // Box vs Box multiple but error
//	CBox box;
//	box.m_length = this->m_length * b.m_length;
//	box.m_breath = this->m_breath * b.m_breath;
//	box.m_height = this->m_height * b.m_height;
//
//	return box;
//}