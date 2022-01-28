//Person.cpp
#include "Person.h"
CPerson::Cperson(const string& strName, int nAge){
	m_strName = strName;
	m_nAge = nAge;
	cout << "No. "<< ++m_nPersonCount << " Create Person" <<endl;
}

CPerson::~CPerson(){
	//m_nPersonCount--;
	cout << "Person Count " << m_nPersonCount-- << endl;
}
void CPerson::ShowPersonInformation(){
	cout << "This Person's name" << m_strName << ", Age = " << m_nAge << endl;
}

int CPerson::PersonCount(){
	return m_nPersonCount;
}