/*===========================
	IAcctDAO.java
	- 은행 리스트를 가져오거나, 수정하거나, 삭제할 DAO
	- 범례 DAO.
==========================*/

package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.AcctDTO;

public interface IAcctDAO
{
	// 은행 리스트 열람
	public ArrayList<AcctDTO> list();
	
	// 은행 범례 데이터 삽입
	
	// 은행 범례 데이터 수정
	
	// 은행 범례 데이터 삭제
}
