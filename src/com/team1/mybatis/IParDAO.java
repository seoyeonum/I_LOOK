/* ==================
 	IParDAO.java
=================== */

package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.ParDTO;
import com.team1.dto.ParWithdrawedDTO;

public interface IParDAO
{
	// 회원 등록 
	public int add(ParDTO parent);
	
	// 회원 탈퇴 (탈퇴 테이블에 insert)
	public int addWithdrawed(ParWithdrawedDTO parent_withdrawed);
	
	// 회원 수정
	public int modify(ParDTO parent);
	
	// 회원 리스트 
	public ArrayList<ParDTO> list();
	
	// 회원 전체 인원 수
	public int countMember();
	
	// (부모 백업 코드로) 현재 보유 포인트 조회
	public int searchPoint(String par_backup_id);
	
	// (부모 백업 코드로) 특정 시점 보유 포인트
	public int searchPointAt(String par_backup_id, String date);
}
