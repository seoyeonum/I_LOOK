/*==============================
	ISitCareListDAO.java
	- 안예지가 만든 시터 마이페이지에서
	  근무 등록 내역 확인, 같은 페이지의 상세 정보 AJAX 처리,
	  돌봄 제공 내역 확인, 같은 페이지의 상세 정보 새창 처리,
	  돌봄 완료 내역 확인(일반 혹은 긴급)
	  에 필요한 모든 메소드를 담아놓는 IDAO.
==========================*/

package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.SitCareListDTO;

public interface ISitCareListDAO
{
	// 근무 등록 내역 확인
	public ArrayList<SitCareListDTO> regList(String sit_backup_id);
	
	// 근무 등록 내역 확인의 상세 정보 AJAX 처리
	public SitCareListDTO regDetailedList(String gen_req_id);
	
	// 돌봄 제공 수락
	public int yesCare(String gen_req_id);
	
	// 돌봄 제공 거절
	public int noCare(String gen_req_id);
	 
	// 돌봄 제공 내역 확인
	public ArrayList<SitCareListDTO> answerList(String sit_backup_id);
	
	// 돌봄 제공 내역 확인의 상세 정보 새창 처리
	public SitCareListDTO answerDetailedList(String gen_req_id);
	
	// 돌봄 완료 내역 확인(일반)
	public ArrayList<SitCareListDTO> genCompleteList(String sit_backup_id);
	
	// 돌봄 완료 내역 확인(긴급)
	public ArrayList<SitCareListDTO> emgCompleteList(String sit_backup_id);
	
	
	
	
}
