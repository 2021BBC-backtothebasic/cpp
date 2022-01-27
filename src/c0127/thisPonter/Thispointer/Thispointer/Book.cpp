#include "Book.h"

//선언부와 같은 생성자
CBook::CBook(){/* - */ }
CBook::CBook(const string& strTitle, int nTotalPage) {
	m_strTitle = strTitle;
	m_nTotalPage = nTotalPage;
	m_nCurrentPage = 0;
	SetPercent(); //헤더에서 선언해줬기 때문에 에러없음
}

// 복사생성자 CBook::CBook(const CBook& orgBook) {
//		m_strTitle = orgBook.m_strTitle;
//		m_nTotalPage = orgBook.m_nTotalPage;
//		m_nCurrentPage = orgBook.m_nCurrentPage;
//		m_fPercent = orgBook.m_fPercent;
//}

//type ClassName
void CBook::SetPercent() //마찬가지로 헤더에서 선언된것 구현체
{
	m_fPercent = (double)m_nCurrentPage / m_nTotalPage * 100; // double로 형변환
}
const CBook& CBook::ThickerBook(const CBook& compBook) {
	//this pointer
	if (compBook.m_nTotalPage > this->m_nTotalPage) {//this는 CBook자체를 포인터해옴
		return compBook;
	}
	else {
		return *this; //this가 가지고있는것에대한 오브젝트 : 자기자신의 주소를 가져옴
	}
}