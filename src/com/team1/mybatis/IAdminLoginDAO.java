/* ========================
 	IAdminLoginDAO.java
  ======================== */
package com.team1.mybatis;

import com.team1.dto.AdminDTO;

public interface IAdminLoginDAO
{
	// 관리자 아이디
	// public int adminid(AdminDTO adminId);
	
	// 관리자 비밀번호
	// public int adminpw(AdminDTO adminPw);

	// 관리자 아이디, 비밀번호 로그인 정보 확인
	public AdminDTO loginCheck(String id, String pw);
}
