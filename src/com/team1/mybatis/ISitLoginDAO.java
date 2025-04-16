/* ========================
 	ISitterLoginDAO.java
  ======================== */

package com.team1.mybatis;

import com.team1.dto.SitDTO;

public interface ISitLoginDAO
{
	// 시터 아이디
	// public int sitid(SitDTO sitId);
	
	// 시터 비밀번호
	// public int sitpw(SitDTO sitPw);
	
	// 시터 아이디, 비밀번호 로그인 정보 확인
	public SitDTO loginCheck(String id, String pw);
}
