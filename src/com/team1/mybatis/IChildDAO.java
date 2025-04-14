/* =================
 	IChildDAO.java
=================== */

package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.ChildDTO;

public interface IChildDAO
{
	// 아이 정보 등록
	public int add(ChildDTO child);
	
	// 아이 정보 수정 
	public int modify(ChildDTO child);

	// 아이 정보 삭제
	public int remove(ChildDTO child);
	
	// 아이 전체 리스트 
	public ArrayList<ChildDTO> list();
	
	// 특정 아이 리스트 
	public ArrayList<ChildDTO> childList();
	
	// 아이 전체 인원 수 
	public int countChild();
	
	// 아이 지병 등록
	public int addDisease(ChildDTO disease);
	
	// 아이 지병 조회
	public ArrayList<String> searchDisease(String child_backup_id);
	
	// 아이 지병 삭제
	public int removeDisease(ChildDTO disease);
	
	// 아이 알레르기 등록
	public int addAllergy(ChildDTO allergy);
	
	// 아이 알레르기 조회
	public ArrayList<String> searchAllergy(String child_backup_id);
	
	// 아이 알레르기 삭제
	public int removeAllergy(ChildDTO allergy);
	
	// 아이 장애 등록
	public int addDisability(ChildDTO disability);
	
	// 아이 장애 조회
	public ArrayList<String> searchDisability(String child_backup_id);
	
	// 아이 장애 삭제
	public int removeDisability(ChildDTO disability);
}
