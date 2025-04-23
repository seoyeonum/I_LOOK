/* =========================
 	IParWithdrawedDAO.java
========================== */

package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.ParWithdrawedDTO;

public interface IParWithdrawedDAO
{
	// 부모 탈퇴 (탈퇴 테이블에 insert)
	public int add(ParWithdrawedDTO parent_withdrawed);
	
	// 탈퇴 회원 리스트 확인
	public ArrayList<ParWithdrawedDTO> list();
	
	// 탈퇴 회원 인원 수 확인
	public int countWithdrawed();
	
	// 해당 par_backup_id로 탈퇴 이력이 있는지 확인
	// 탈퇴하면 재로그인 불가능 위해.
	public int checkWithdrawed(String par_backup_id);

	
	// 조회
	// public ParWithdrawedDTO search(String id);
}
