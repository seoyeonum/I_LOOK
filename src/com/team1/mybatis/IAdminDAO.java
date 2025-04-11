package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.AdminDTO;

public interface IAdminDAO
{
	// 관리자 정보 조회
	public ArrayList<AdminDTO> list();
	
	// 관리자 정보 수정
	public int update(AdminDTO admin);
	
}
