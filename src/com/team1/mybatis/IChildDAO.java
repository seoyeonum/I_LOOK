/* =================
 	IChildDAO.java
=================== */

package com.team1.mybatis;

import java.util.ArrayList;

public interface IChildDAO
{
	// 아이 정보 등록
	public int add(ChildDTO c);
	
	// 아이 정보 수정 
	public int modify(ChildDTO c);

	// 아이 정보 삭제
	public int remove(ChildDTO c);
	
	// 아이 리스트 
	public ArrayList<ChildDTO> list();
	
	// 아이 전체 인원 수 
	public int countChild();
	
	// 아이 지병 등록
	public int addDisease(ChildDTO d);
	
	// 아이 지병 삭제
	public int removeDisease(ChildDTO d);
	
	// 아이 알레르기 등록
	public int addAllergy(ChildDTO a);
	
	// 아이 알레르기 삭제
	public int modifyAllergy(ChildDTO a);
	
	// 아이 장애 등록
	public int addDisability(ChildDTO di);
	
	// 아이 장애 삭제
	public int removeDisability(ChildDTO di);
}
