/*==============================
	IAgesPreferedDAO.java
	- 선호 연령대 IDAO

=================================*/

package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.AgesPreferedDTO;

public interface IAgesPreferedDAO
{
	// 일반 근무 등록 시에 근무 등록 아이디를 넣으면 시터 돌봄 선호 연령대를 열람할 수 있음
	public ArrayList<AgesPreferedDTO> listAges(String gen_reg_id);
	
	// 시터 돌봄 선호 연령대 전체 열람
	public ArrayList<AgesPreferedDTO> listAges();
	
	// 시터 돌봄 선호 연령대 추가
	public int addAges(AgesPreferedDTO ages);
	
	// 시터 돌봄 선호 연령대 수정
	public int modifyAges(AgesPreferedDTO ages);
	
	// 시터 돌봄 선호 연령대 삭제
	public int removeAges(String gen_reg_id);
}
