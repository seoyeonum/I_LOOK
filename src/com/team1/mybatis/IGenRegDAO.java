/* ====================
 	IGenRegDAO.java
===================== */

package com.team1.mybatis;

import java.util.ArrayList;
import java.util.Map;

import com.team1.dto.GenRegDTO;

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
	
	// 근무 등록 아이디에 따른 근무 파일 1개
	public GenRegDTO regList(String gen_reg_id);
	
	// 특정 아이디에 따른 근무 리스트
	public ArrayList<GenRegDTO> regListId(String gen_reg_id);
	
	// (부모가 보는) 1차 필터 결과 리스트
	public ArrayList<GenRegDTO> listPrimaryGenReg(GenRegDTO gen_reg);
	
	// (부모가 보는) 1차 필터 결과 리스트 건수
	public int countPrimaryGenReg(GenRegDTO gen_reg);
	
	// (근무 등록 건별) 시터 선호 근무 지역
	public ArrayList<String> listSitPreferedRegion(String gen_reg_id);
	
	// (부모가 보는) 2차 필터 결과 리스트
	public ArrayList<GenRegDTO> listSecondaryGenReg(Map<String, Object> params);
}
