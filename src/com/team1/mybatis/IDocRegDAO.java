/*=================================
	IDocRegDAO.java
	시터 검증 서류 IDAO
==================================*/

package com.team1.mybatis;

import java.util.List;

import com.team1.dto.DocRegDTO;

public interface IDocRegDAO
{
	// [관리자] 서류 등록
	public int addDoc(DocRegDTO docreg);
	
	// [관리자] 서류 수정
	public int modifyDoc(DocRegDTO docreg);
	
	// [관리자] 서류 삭제
	// public int removeDoc(DocRegDTO docreg);
	
	// [관리자] 회원가입 코드로 테이블 찾기
	public List<DocRegDTO> search(String sit_reg_id);
}
