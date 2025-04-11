/*================
	ISitWithdrawedDAO.java
===============*/

package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.SitWithdrawedDTO;

public interface ISitWithdrawedDAO
{
	// 시터 탈퇴 내역 추가
	public int add(SitWithdrawedDTO s);
	
	// 시터 탈퇴 내역 리스트 확인
	public ArrayList<SitWithdrawedDTO> list();
	
	// 시터 탈퇴 내역 확인
	// → emg_point_id 를 활용하여 시터 탈퇴 내역 조회
	public SitWithdrawedDTO search(String sit_withdrawed_id);
	
	// 시터 탈퇴 내역 수 확인
	public int count();
	
	// 시터 탈퇴 내역 수정 → (Ⅹ)
	// 시터 탈퇴 내역 삭제 → (Ⅹ)
}
