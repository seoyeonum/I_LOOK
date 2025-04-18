/* ========================
 	IParentLoginDAO.java
  ======================== */

package com.team1.mybatis;

import org.apache.ibatis.annotations.Param;

import com.team1.dto.ParDTO;

public interface IParLoginDAO
{
	// 부모 아이디
	//public int parid(ParDTO parId);
	
	// 부모 비밀번호
	//public int parpw(ParDTO parPw);
	
	// 부모 아이디, 비밀번호 로그인 정보 확인
	//public ParDTO loginCheck(String id, String pw);
	
	public ParDTO loginCheck(@Param("id") String id, @Param("pw") String pw);
}
