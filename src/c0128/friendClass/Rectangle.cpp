#include "Rectangle.h"

CRectangle::CRectangle(int width, int height)
{
    m_width = width;
    m_height = height;
}
int CRectangle::GetArea(){
    return m_width * m_height;
}

CRectangle CRectangle::operator*(int mul) const
{
    return CRectangle(m_width * mul, m_height * mul);
}

CRectangle operator*(int mul, const CRectangle& orgRect){
    return orgRect * mul;
}