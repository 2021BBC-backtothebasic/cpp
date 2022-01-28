//shape.h
#ifndef __SHAPE_H_
#define __SHAPE_H_
#include <iostream>
using namespace std;
class CShape
{
protected:
int m_nWidth, m_nHeight;

public:
	CShape(); //default constructor
	CShape(int nWidth, int nHeight);
	virtual int Area() = 0;
}

#endif