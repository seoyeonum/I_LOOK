package com.team1.mybatis;

import java.util.ArrayList;

public interface IAdminDAO
{
	// 관리자 정보 조회
	public ArrayList<AdminDTO> adminlist();
	
	// 관리자 정보 수정
	public int update(AdminDTO admin);
}
