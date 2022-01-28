#include <iostream>
#include "Rectangle.h"
#include "Triangle.h"
using namespace std;

int main(){
	CRectangle* rect = new CRectangle(30,50);
	CTriangle* triangle = new CTriangle();

	CRectangle rect1 = (*rect) * 2;
	CRectangle rect2 = (*rect) * 4;

	cout << "Rectangele Area : " << rect->GetArea() << endl;

	triangle->SetWidth(30);
	triangle->SetWidth(50);	

}