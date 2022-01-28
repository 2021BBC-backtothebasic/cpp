//Rectangle.h
"#pragma once
#include "Shape.h"

class CRectangle
	:public CShape{
public:
	int GetArea();
	CRectangle operator*(double) const;friend CRectangle operator*(double mul, const CRectangle&); //Friend function };