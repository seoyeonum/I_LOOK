/*================
	ISitViolDAO.java
===============*/

package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.SitViolDTO;

public interface ISitViolDAO
{
	// 시터 위반 내역 추가
	public int add(SitViolDTO s);
	
	// 시터 위반 내역 리스트 확인
	public ArrayList<SitViolDTO> list();
	
	// 시터 위반 내역 확인
	// → 이름을 활용하여 시터 위반 내역 조회
	public SitViolDTO searchName(String name);
	
	// 시터 위반 내역 확인
	// → 시터 코드를 활용하여 시터 위반 내역 조회
	public SitViolDTO searchSitcode(String sit_backup_id);
	
	// 시터 위반 내역 수 확인
	public int count();
	
	// 시터 위반 내역 수정 → (Ⅹ)
	// 시터 위반 내역 삭제 → (Ⅹ)
}
