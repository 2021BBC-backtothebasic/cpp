//AccessSpecifiers.cpp

#include <iostream>
using namespace std;

class CBox{
protected:
		double m_width;
};
class CSmallBox : public CBox{
public:
	void SetSmallWidth(double width);
	double GetSmallWidth();
};

void CSmallBox::SetSmallWidth(double width){
	m_width = width;
}

double CSmallBoxx::GetSmallWidhtth(){
	return m_width;
}
int main(){
	CSmallBox* smallBox = new CSmallBox(); //동적할당

	smallBox->SetSmallWidth(5.0);
	cout<< "Width of small box: " << smallBox->GetSmallWidth() << endl;

	delete smallBox;
	return 0;
}