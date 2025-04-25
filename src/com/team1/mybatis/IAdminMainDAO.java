package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.AdminDTO;

public interface IAdminMainDAO
{
	// 관리자 정보 조회
	public ArrayList<AdminDTO> list();
	
	// 관리자 정보 수정
	public int update(AdminDTO admin);
	
	// 관리자 찾기
	public AdminDTO search(String admin_reg_id);
	
	// 회원가입 요청 수
	public int countReg();
	
	//  일일 일반돌봄 예약 수 
	public int countGenReq();
	
}
