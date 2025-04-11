/* ====================
 	IGenRegDAO.java
===================== */

package com.team1.mybatis;

import java.util.ArrayList;

public interface IGenRegDAO
{
	// 일반 돌봄 근무 등록
	public int add(GenRegDTO gen_reg);
	
	// 일반 돌봄 근무 삭제
	public int remove(GenRegDTO gen_reg);
	
	// 시터 근무 가능 목록
	public ArrayList<GenRegDTO> list();
	
	// 전체 근무 등록 수 확인
	public int countGen();
	
	// 특정 아이디에 따른 근무 리스트
	public ArrayList<GenRegDTO> regList(String gen_reg_id);
}
