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

	// 탈퇴 알림 위해
	// ID로 부모 정보 가져오기 (비밀번호 X)
	public ParDTO findById(String id);                // ID로 PAR_BACKUP_ID 조회
	public ParDTO findPwByBackupId(String par_backup_id); // 백업 ID로 비밀번호 확인
	
	// ■ 회원가입 시 ID(=ID) 중복 체크
	public int checkId(String par_reg_id);

		

}
