//ShapeInheritence.cpp
#include <iostream>
#include "Rectangle.h"
#include "Triangle.h"

using namespace std;

int main(){
	CRectangle* rect = new RCRectangle();
	CTriangle* triangle = new CTriangle();

	rect->SetWidth(30);
	rect->SetHeight(50);
	cout << "Rectangle Area: :" << rect->GetArea() << endl;

	triangle->SetWidth(30);
	triangle->SetHeight(50);
	cout << "Rectangle Area: :" << rect->GetArea() << endl;
	
	if(rect != NULL) delete rect;
	if(triangle != NULL )  delete triangle;	
	return 0;
}