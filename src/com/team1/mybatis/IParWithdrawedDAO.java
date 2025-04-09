/* =========================
 	IParWithdrawedDAO.java
========================== */

package com.team1.mybatis;

import java.util.ArrayList;

public interface IParWithdrawedDAO
{
	// 부모 탈퇴 (탈퇴 테이블에 insert)
	public int add(ParWithdrawedDTO parent_withdrawed);
	
	// 탈퇴 회원 리스트 확인
	public ArrayList<ParWithdrawedDTO> list();
	
	// 탈퇴 회원 인원 수 확인
	public int countWithdrawed();
	
	// 조회
	// public ParWithdrawedDTO search(String id);
}
