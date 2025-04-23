/* ========================
 	ISitterLoginDAO.java
  ======================== */

package com.team1.mybatis;

import java.util.List;

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
	public List<SitDTO> loginCheck(@Param("id") String id, @Param("pw") String pw);

	public SitDTO findById(String id);  // ID로 백업 코드 조회
	public SitDTO findPwByBackupId(String sit_backup_id);  // PW 확인용


}
