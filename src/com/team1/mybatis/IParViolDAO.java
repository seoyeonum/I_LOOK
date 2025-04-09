/* ====================
 	IParViolDAO.java
====================--= */

package com.team1.mybatis;

import java.util.ArrayList;

public interface IParViolDAO
{
	// 위반 사항 기록 입력 (등록)
	public int add(ParViolDTO parent_vio);
	
	// 전체 위반사항 리스트
	public ArrayList<ParViolDTO> list();
	
	// 전체 위반사항 수 
	public int countParVio();
}
