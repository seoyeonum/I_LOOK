/* ========================
 	ISitterLoginDAO.java
  ======================== */

package com.team1.mybatis;

import org.apache.ibatis.annotations.Param;

import com.team1.dto.SitDTO;

public interface ISitLoginDAO
{
	// 시터 아이디
	// public int sitid(SitDTO sitId);
	
	// 시터 비밀번호
	// public int sitpw(SitDTO sitPw);
	
	// 시터 아이디, 비밀번호 로그인 정보 확인
	//public SitDTO loginCheck(String id, String pw);
	// public SitDTO loginCheck(@Param("id") String id, @Param("pw") String pw);
	public SitDTO loginCheck(@Param("id") String id, @Param("pw") String pw);

	public String findById(String id);  // ID로 백업 코드 조회
	public SitDTO findPwByBackupId(String sit_backup_id);  // PW 확인용

	// 시터 회원 가입 중복 체크
	public int checkId(String sit_reg_id);

	// 승인 처리된 시터 백업 아이디
	public int searchSitteChecked(String id);
	
	// 승인 거절된 시터 백업 아이디
	public int searchSitteRejected(String id);
}
