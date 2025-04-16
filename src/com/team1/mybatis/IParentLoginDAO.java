/* ========================
 	IParentLoginDAO.java
  ======================== */

package com.team1.mybatis;

import com.team1.dto.ParDTO;

public interface IParentLoginDAO
{
	// 부모 아이디
	//public int parid(ParDTO parId);
	
	// 시터 아이디
	//public int parpw(ParDTO parPw);
	
	// 부모 아이디, 비밀번호 로그인 정보 확인
	public ParDTO loginCheck(String id, String pw);
}
