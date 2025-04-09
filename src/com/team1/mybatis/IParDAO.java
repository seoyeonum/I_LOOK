/* ==================
 	IParDAO.java
=================== */

package com.team1.mybatis;

import java.util.ArrayList;

public interface IParDAO
{
	// 회원 등록 
	public int add(ParDTO parent);
	
	// 회원 탈퇴 (탈퇴 테이블에 insert)
	public int add(ParWithdrawedDTO parent_withdrawed);
	
	// 회원 수정
	public int modify(ParDTO parent);
	
	// 회원 리스트 
	public ArrayList<ParDTO> list();
	
	// 회원 전체 인원 수
	public int countMember();
}
