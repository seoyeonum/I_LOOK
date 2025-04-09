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
}
